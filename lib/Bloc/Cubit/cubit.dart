import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Models/articlesmodel.dart';
import 'package:rosheta_project/Models/usermodel.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/User/usermain/userarticles.dart';
import 'package:rosheta_project/modules/User/usermain/userhome.dart';
import 'package:rosheta_project/modules/User/usermain/userprofile.dart';

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
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.medical_services_outlined), label: 'Articles'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];
  void changenav(index) {
    current = index;
    emit(ChageBottomNavState());
  }

  List<Widget> screens = [
    UserHome(),
    UserArticles(),
    UserProfile(),
  ];
  var scaffoldkey = GlobalKey<ScaffoldState>();

  UserModel? userModel;
  void getuserData() {
    emit(GetUserDataLoading());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromjson(value.data()!);
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
}
