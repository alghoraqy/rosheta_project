import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Models/drugsmodel.dart';
import 'package:rosheta_project/Models/pharmacymodel.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/Shared/variable.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacyhome.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacyprofile.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacyreservation.dart';
import 'package:rosheta_project/modules/login/login.dart';

class PharmacyCubit extends Cubit<PharmacyStates> {
  PharmacyCubit() : super(PharmacyInitialStates());

  static PharmacyCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List screens = [
    const PharmacyHome(),
    const PharmacyReservations(),
    const PharmacyProfile(),
  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var val = 1;
  bool value = false;

  final List<Map<String, dynamic>> radio = [
    {'name': 'Yes, I have', 'is_selected': true},
    {'name': 'No, I haven\'t', 'is_selected': false},
  ];

  void radioBottomCheck(index) {
    for (int i = 0; i < radio.length; i++) {
      if (radio[i]['is_selected'] == true) {
        radio[i]['is_selected'] = false;
        emit(PharmacyRadioCheckState());
      }
    }
    radio[index]['is_selected'] = true;
    emit(PharmacyRadioCheckState());
  }

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.reset_tv), label: 'Reservations'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
  ];

  void changeBotNav(int index) {
    currentIndex = index;
    emit(PharmacyChangeBotNavStates());
  }

  PharmacyModel? pharmacyModel;

  void getpharmacydata() {
    emit(GetPharmacyDataLoading());
    FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(uId)
        .get()
        .then((value) {
      pharmacyModel = PharmacyModel.fromjson(value.data()!);
      print('get pharmacy data');
      drugsid.addAll(value.data()!['drugsuid']);
      emit(GetPharmacyDataSuccess());
    }).catchError((error) {
      print('get pharmacy error ${error.toString()}');
      emit(GetPharmacyDataError(error.toString()));
    });
  }

  // List<DrugsModel> alldrugs = [];
  // void getAlldrugs() {
  //   emit(GetAllDrugsLoading());
  //   FirebaseFirestore.instance.collection('AllDrugs').get().then((value) {
  //     value.docs.forEach(
  //       (element) {
  //         alldrugs.add(DrugsModel.fromjson(element.data()));
  //         emit(GetAllDrugsSuccess());
  //       },
  //     );
  //     print('Alldrugs ${alldrugs[0].name}');
  //     emit(GetAllDrugsSuccess());
  //   }).catchError((error) {
  //     print('Get All Drugs error : ${error.toString()}');
  //     emit(GetAllDrugsError(error.toString()));
  //   });
  // }

  // void putdrugs() {
  //   emit(PutDrugsLoading());
  //   for (var i = 0; i <= alldrugs.length; i++) {
  //     FirebaseFirestore.instance
  //         .collection('pharmacy')
  //         .doc(uId)
  //         .collection('MyDrugs')
  //         .doc()
  //         .set(alldrugs[i].tomap())
  //         .then((value) {
  //       print('Doneee');
  //       emit(PutDrugsSuccess());
  //     }).catchError((error) {
  //       emit(PutDrugsError());
  //     });
  //   }
  // }

  List<DrugsModel> myDrugs = [];
  List drugsid = [];

  Future<void> getMydrugs() {
    emit(GetMyDrugsLoading());
    return FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(uId)
        .collection('MyDrugs')
        .orderBy(
          'uid',
          descending: false,
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        myDrugs.add(DrugsModel.fromjson(element.data()));
      });
      print('Get Drugs success');
      emit(GetMyDrugsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetMyDrugsError(error.toString()));
    });
  }

  void updatedrugs({
    required String uid,
    required dynamic quantity,
    dynamic price,
  }) {
    emit(UpdateDrugsLoading());
    FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(uId)
        .collection('MyDrugs')
        .doc(uid)
        .update({'quantity': quantity, 'price': price}).then((value) {
      myDrugs = [];
      drugsuid = [];
      getMydrugs().then((value) {
        updateindex = 0;
        updatedrugpricecontroller.text = '';
      });
      print('Updated success');
      print(drugsuid.length);
      print(uid);
    }).catchError((error) {
      print('Update Drugs Error : ${error.toString()}');
      emit(UpdateDrugsError(error.toString()));
    });
  }

  void deletedrug({
    required String uid,
  }) {
    emit(UpdateDrugsLoading());
    FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(uId)
        .collection('MyDrugs')
        .doc(uid)
        .delete()
        .then((value) {
      myDrugs = [];
      drugsuid = [];
      getMydrugs();
      print('deleted success');
      print(uid);
    }).catchError((error) {
      print('Update Drugs Error : ${error.toString()}');
      emit(UpdateDrugsError(error.toString()));
    });
  }

  TextEditingController updatedrugpricecontroller = TextEditingController();
  int updateindex = 0;

  void increaseupdate() {
    updateindex++;
    print('increase');
    print(updateindex);
    emit(IncreaseUpdate());
  }

  void decreaseupdate() {
    updateindex--;
    if (updateindex < 0) {
      updateindex = 0;
    }
    print('decrease');
    print(updateindex);
    emit(DecreaseUpdate());
  }

  void updatephamacy({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String open,
    required String close,
    required double latitude,
    required double longitude,
  }) {
    PharmacyModel model = PharmacyModel(
        name: name,
        address: address,
        email: email,
        phone: phone,
        longitude: latitude,
        latitude: latitude,
        image: pharmacyModel!.image,
        open: open,
        close: close,
        uId: pharmacyModel!.uId,
        drugsuid: pharmacyModel!.drugsuid);
    FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(model.uId)
        .update(model.tomap())
        .then((value) {
      getpharmacydata();
      emit(UpdatePharmacyDataSuccess());
    }).catchError((error) {
      emit(UpdatePharmacyDataError());
    });
  }

  Future<void> signOut(context) {
    return FirebaseAuth.instance.signOut().then((value) {
      CashHelper.removeData().then((value) {
        uId = null;
        address = "";
        latitude = 0.0;
        longitude = 0.0;
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }), (route) => false);
        emit(SignOutSuccessPharmacy());
      });
    }).catchError((error) {});
  }

  List<PharmacyModel> pharmacyUser = [];

  void getPharmaciesUsers() {
    emit(GetAllPharmaciesLoading());
    if (pharmacyUser.isEmpty) {
      FirebaseFirestore.instance.collection('pharmacy').get().then((value) {
        value.docs.forEach((element) {
          pharmacyUser.add(PharmacyModel.fromjson(element.data()));
        });
        emit(GetAllPharmaciesSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetAllPharmaciesError(error.toString()));
      });
    }
  }
}
