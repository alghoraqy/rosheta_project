import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isuser = true;

  void userLogin({required String email, required String password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessStates(uId: value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorStates(error: error.toString()));
    });
  }
}
