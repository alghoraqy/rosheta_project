import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymaster/pharmacymaster.dart';
import 'package:rosheta_project/modules/User/usermaster/usermaster.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isuser = true;

  void userLogin(context, {required String email, required String password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      loginfilter(context, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorStates(error: error.toString()));
    });
  }

  void loginfilter(context, {required String uId}) {
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print('Ussser');
      print(value.data());
      if (value.data() == null) {
        emit(LoginFilterPharmacy(uId: uId));
      } else {
        emit(LoginFilterUser(uId: uId));
      }
    }).catchError((error) {
      emit(LoginFilterError(error: error));
    });
  }
}
