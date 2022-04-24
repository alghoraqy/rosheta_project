import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Models/usermodel.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitRegisterStates());
  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }

  // user
  var userfullNamecontroller = TextEditingController();
  var useremailregistercontroller = TextEditingController();
  var userpasswordregistercontroller = TextEditingController();
  var userpasswordconfirmcontroller = TextEditingController();
  var useraddresscontroller = TextEditingController();
  var userphonecontroller = TextEditingController();

//pharmacy
  var pharmacyfullNamecontroller = TextEditingController();
  var pharmacyemailregistercontroller = TextEditingController();
  var pharmacypasswordregistercontroller = TextEditingController();
  var pharmacypasswordconfirmcontroller = TextEditingController();
  var pharmacyaddresscontroller = TextEditingController();
  var pharmacyphonecontroller = TextEditingController();

  var codecontroller = TextEditingController();
  var openincontroller = TextEditingController();
  var closeincontroller = TextEditingController();

  var formkey1 = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();
  var formkey3 = GlobalKey<FormState>();

  var val = 1;
  void onchangeradio(value) {
    val = value;
    emit(Changeradio());
  }

  bool isuser = true;
  void changeuser() {
    isuser = true;
    emit(Changeuser());
  }

  void changePharmacy() {
    isuser = false;
    emit(ChangePharmacy());
  }

  Timer? timer;
  int start = 59;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          emit(Changetimer());
        } else {
          start--;
          emit(Changetimer());
        }
      },
    );
  }

  bool pressure = false;
  void changecheck1(value) {
    pressure = value;
    emit(ChangeCheck());
  }

  bool diabetes = false;
  void changecheck2(value) {
    diabetes = value;
    emit(ChangeCheck());
  }

  bool heart = false;
  void changecheck3(value) {
    heart = value;
    emit(ChangeCheck());
  }

  bool chest = false;
  void changecheck4(value) {
    chest = value;
    emit(ChangeCheck());
  }

  bool sinuses = false;
  void changecheck5(value) {
    sinuses = value;
    emit(ChangeCheck());
  }

  final List<Map<String, dynamic>> radio = [
    {'name': 'Yes, I have', 'is_selected': true},
    {'name': 'No, I haven\'t', 'is_selected': false},
  ];
  void radioBottomCheck(index) {
    for (int i = 0; i < radio.length; i++) {
      if (radio[i]['is_selected'] == true) {
        radio[i]['is_selected'] = false;
        emit(RadioChangeCheck());
      }
    }
    radio[index]['is_selected'] = true;
    emit(RadioChangeCheck());
  }

  String? uid;

  void userregister({
    required String email,
    required String name,
    required String password,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = value.user!.uid;
      createuser1(name: name, email: email, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }

  void pharmacyregister({
    required String email,
    required String name,
    required String password,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = value.user!.uid;
      createpharmacy1(name: name, email: email, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }

  void createuser1({
    required String name,
    required String email,
    required String uId,
  }) {
    FirebaseFirestore.instance.collection('users').doc(uId).set({
      'name': name,
      'email': email,
      'image':
          'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/female.png?alt=media&token=a2b02189-ab26-4dfb-ac7b-21ea0a9b4eed',
      'isuser': isuser,
      'uId': uId,
    }).then((value) {
      emit(CreateSuccessStates(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  void createpharmacy1({
    required String name,
    required String email,
    required String uId,
  }) {
    FirebaseFirestore.instance.collection('pharmacy').doc(uId).set({
      'name': name,
      'email': email,
      'isuser': isuser,
      'uId': uId,
    }).then((value) {
      emit(CreateSuccessStates(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  void createuser2({
    required String address,
    required String phone,
    required String uId,
  }) {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'address': address,
      'phone': phone,
    }).then((value) {
      emit(CreateSuccessStates2(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  void createpharmacy2({
    required String address,
    required String phone,
    required String uId,
  }) {
    FirebaseFirestore.instance.collection('pharmacy').doc(uid).update({
      'address': address,
      'phone': phone,
    }).then((value) {
      emit(CreateSuccessStates2(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  void createpharmacy3({
    required String open,
    required String close,
    required String uId,
  }) {
    FirebaseFirestore.instance.collection('pharmacy').doc(uid).update({
      'open at': open,
      'close at': close,
    }).then((value) {
      emit(CreateSuccessStates3(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }
}
