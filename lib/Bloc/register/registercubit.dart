import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(InitRegisterStates());
  static RegisterCubit get(context){
    return BlocProvider.of(context);
  }
 
  var fullNamecontroller= TextEditingController();
  var emailregistercontroller= TextEditingController();
  var passwordregistercontroller= TextEditingController();
  var passwordconfirmcontroller= TextEditingController();
  var addresscontroller= TextEditingController();
  var phonecontroller= TextEditingController();
  var codecontroller= TextEditingController();
  var openincontroller= TextEditingController();
  var closeincontroller= TextEditingController();

  var formkey1=GlobalKey<FormState>();
  var formkey2=GlobalKey<FormState>();
  var formkey3=GlobalKey<FormState>();

  var val=1;
  void onchangeradio(value){
    val=value;
    emit(Changeradio());
  }

  bool isuser= true;
  void changeuser(){
    isuser =true;
    emit(Changeuser());
  }
  void changePharmacy(){
    isuser =false;
    emit(ChangePharmacy());
  }

Timer? timer;
int start = 59;

void startTimer() {
  const oneSec =  Duration(seconds: 1);
  timer = Timer.periodic(
    oneSec,
    (Timer timer) {
    if (start==0) {
      timer.cancel();
      emit(Changetimer());
    }else{
      start--;
      emit(Changetimer());
    }
    },
  );
}

bool pressure =false;
void changecheck1(value){
  pressure = value;
  emit(ChangeCheck());
}
bool diabetes =false;
void changecheck2(value){
  diabetes = value;
  emit(ChangeCheck());
}
bool heart =false;
void changecheck3(value){
  heart = value;
  emit(ChangeCheck());
}
bool chest =false;
void changecheck4(value){
  chest = value;
  emit(ChangeCheck());
}
bool sinuses =false;
void changecheck5(value){
  sinuses = value;
  emit(ChangeCheck());
}


  final List<Map<String, dynamic>> radio = [
    {'name': 'Yes, I have', 'is_selected': true},
    {'name': 'No, I haven\'t', 'is_selected': false},
  ];
  void radioBottomCheck(index)
  {
    for(int i=0; i<radio.length; i++){
      if(radio[i]['is_selected']== true){
        radio[i]['is_selected']= false;
        emit(RadioChangeCheck());
      }
    }
    radio[index]['is_selected']= true;
    emit(RadioChangeCheck());
  }

}

