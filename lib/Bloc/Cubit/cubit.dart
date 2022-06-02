

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Models/articlesmodel.dart';
import 'package:rosheta_project/Models/drugsmodel.dart';
import 'package:rosheta_project/Models/pharmacymodel.dart';
import 'package:rosheta_project/Models/usermodel.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/User/usermain/userarticles.dart';
import 'package:rosheta_project/modules/User/usermain/userhome.dart';
import 'package:rosheta_project/modules/User/usermain/userprofile.dart';

import '../../Shared/variable.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(InitStates());
  static UserCubit get(context) {
    return BlocProvider.of(context);
  }

  var editpasswordcontroller = TextEditingController();
  var confirmeditpasswordcontroller = TextEditingController();

  bool specialpackage = true;

  void changespecial() {
    specialpackage = true;
    emit(ChangeSpecial());
  }

  void changepremium() {
    specialpackage = false;
    emit(ChangePremium());
  }

  int current = 0;
  List<BottomNavigationBarItem> navList = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.medical_services_outlined), label: 'Articles'),
    const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];
  void changenav(index) {
    current = index;
    emit(ChageBottomNavState());
  }

  List<Widget> screens = [
    const UserHome(),
    const UserArticles(),
    const UserProfile(),
  ];
  var scaffoldkey = GlobalKey<ScaffoldState>();

  UserModel? userModel;
  void getuserData() {
    emit(GetUserDataLoading());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print('get user data success');
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccess());
    }).catchError((error) {
      print(error.toString());
      GetUserDataError(error.toString());
    });
  }

  List<ArticlesModel> articles = [];
  void getArticles() {
    print('run--------');

    FirebaseFirestore.instance.collection('Articles').get().then((value) {
      value.docs.forEach((element) {
        articles.add(ArticlesModel.fromjson(element.data()));
        emit(GetArticlesSuccess());
      });
      print('this is articles ${articles[2].title}');

      emit(GetArticlesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetArticlesError(error.toString()));
    });
  }

  TextEditingController searchdrugcontroller = TextEditingController();

  DrugsModel? searchdrug;
  List<String> pharmacydrugIn = [];
  void getSearchdrug({required String text}) {
    searchdrug = null;
    pharmacydruginData = [];
    print('in search');
    emit(GetSearchDrugLoading());
    for (var i = 0; i < pharmacyId.length; i++) {
      FirebaseFirestore.instance
          .collection('pharmacy')
          .doc(pharmacyId[i])
          .collection('MyDrugs')
          .where('name', isEqualTo: text)
          .where('quantity', isGreaterThan: 0)
          .get()
          .then((value) {
        value.docs.forEach(
          (element) {
            print('element.id: ${element.id}');
            print('pharmacy.id: ${pharmacyId[i]}');
            print(element.data());
            pharmacydrugIn.add(pharmacyId[i]);
            searchdrug = DrugsModel.fromjson(element.data());
            getPharmacydrugInData(id: pharmacyId[i]);
          },
        );
        print('Get Search Drug Success');
      }).catchError((error) {
        print('Get Search Drug Error : ${error.toString()}');
        emit(GetSearchDrugError(error.toString()));
      });
    }
  }

  List<String> pharmacyId = [];

  void getallPharmacyId() {
    emit(GetAllPharmacyIdLoading());
    FirebaseFirestore.instance.collection('pharmacy').get().then((value) {
      value.docs.forEach((element) {
        pharmacyId.add(element.id);
      });
      print('Get All Pharmacy Id Success');
      print(pharmacyId);
      emit(GetAllPharmacyIdSuccess());
    }).catchError((error) {
      print('Get All Pharmacy Id Error : ${error.toString()}');
      emit(GetAllPharmacyIdError(error.toString()));
    });
  }

  List<PharmacyModel> pharmacydruginData = [];
  void getPharmacydrugInData({required String id}) {
    emit(GetPharmacyDrugInDataLoading());
    FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(id)
        .get()
        .then((value) {
      pharmacydruginData.add(PharmacyModel.fromjson(value.data()!));
      emit(GetPharmacyDrugInDataSuccess());
    }).catchError((error) {
      print('Get Pharmacy Drug In Data Error : ${error.toString()}');
      emit(GetPharmacyDrugInDataError());
    });
  }

  void updateUser({
    required String name,
    required String email,
    required String phone,
    required String address,
    required double latitude,
    required double longitude,
  }) {
    UserModel model = UserModel(
        name: name,
        email: email,
        latitude:latitude ,
        longitude:longitude ,
        phone: phone,
        uId: userModel!.uId,
        address: address,
        image: userModel!.image);
    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .update(model.tomap())
        .then((value) {
      getuserData();
      emit(UpdateUserDataSuccess());
    }).catchError((error) {
      emit(UpdateUserDataError());
    });
  }

  Future<void> signOut(context) async {
    try{
      await FirebaseAuth.instance.signOut();
      CashHelper.removeData().then((value) {
        uId = null;
        position=null;
        emit(SignOutSuccessUser());
      });
    }
        catch(e){}
  }
}
