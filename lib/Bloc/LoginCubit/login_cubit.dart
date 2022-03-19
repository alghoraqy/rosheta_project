import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }

  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var formkey  =GlobalKey<FormState>();
  bool isuser= true;
  
}