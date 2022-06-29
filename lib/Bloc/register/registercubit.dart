import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Models/drugsmodel.dart';
import 'package:rosheta_project/Models/usermodel.dart';
import 'package:rosheta_project/constant.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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

  // GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  // GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  // GlobalKey<FormState> formkey3 = GlobalKey<FormState>();

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

  Future<void> userregister({
    required String email,
    required String name,
    required String password,
  }) {
    emit(Loading());
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = value.user!.uid;
      createuser1(name: name, email: email, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }

  Future<void> pharmacyregister({
    required String email,
    required String name,
    required String password,
  }) {
    emit(Loading());
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = value.user!.uid;
      createpharmacy1(name: name, email: email, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }

  Future<void> createuser1({
    required String name,
    required String email,
    required String uId,
  }) {
    emit(Loading());
    return FirebaseFirestore.instance.collection('users').doc(uId).set({
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

  Future<void> createpharmacy1({
    required String name,
    required String email,
    required String uId,
  }) {
    emit(Loading());
    return FirebaseFirestore.instance.collection('pharmacy').doc(uId).set({
      'name': name,
      'email': email,
      'image': 'https://en.pimg.jp/065/798/123/1/65798123.jpg',
      'isuser': isuser,
      'uId': uId,
    }).then((value) {
      emit(CreateSuccessStates(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  Future<void> createuser2({
    required String address,
    required String phone,
    required String uId,
    required dynamic lat,
    required dynamic lng,
  }) {
    emit(Loading());
    return FirebaseFirestore.instance.collection('users').doc(uid).update({
      'address': address,
      'phone': phone,
      'latitude': lat,
      'longitude': lng,
    }).then((value) {
      emit(CreateSuccessStates2(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  Future<void> createpharmacy2({
    required String address,
    required String phone,
    required String uId,
    required dynamic lat,
    required dynamic lng,
  }) {
    emit(Loading());
    return FirebaseFirestore.instance.collection('pharmacy').doc(uid).update({
      'address': address,
      'phone': phone,
      'latitude': lat,
      'longitude': lng,
    }).then((value) {
      emit(CreateSuccessStates2(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  Future<void> createpharmacy3({
    required String open,
    required String close,
    required String uId,
  }) {
    emit(Loading());
    return FirebaseFirestore.instance.collection('pharmacy').doc(uid).update({
      'open': open,
      'close': close,
    }).then((value) {
      emit(CreateSuccessStates3(uId));
    }).catchError((error) {
      emit(CreateErrorStates());
    });
  }

  List<DrugsModel> alldrugs = [];
  Future<void> getAlldrugs() {
    emit(GetAllDrugsLoading());
    return FirebaseFirestore.instance
        .collection('AllDrugs')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          alldrugs.add(DrugsModel.fromjson(element.data()));
        },
      );
      print('Alldrugs ${alldrugs[0].name}');
      emit(GetAllDrugsSuccess());
    }).catchError((error) {
      print('Get All Drugs error : ${error.toString()}');
      emit(GetAllDrugsError(error.toString()));
    });
  }

  // Future<void> putdrugs() async {
  //   emit(PutDrugsLoading());
  //   for (var i = 0; i < alldrugs.length; i++) {
  //     FirebaseFirestore.instance
  //         .collection('pharmacy')
  //         .doc(uId)
  //         .collection('MyDrugs')
  //         .doc()
  //         .set(alldrugs[i].tomap())
  //         .then((value) {
  //       print('Doneee');
  //     }).catchError((error) {
  //       emit(PutDrugsError());
  //     });
  //   }
  // }

  // static List<Map> convertMyDrugToMap({required List<DrugsModel> drugs}) {
  //   List<Map> mydrugs = [];
  //   drugs.forEach((DrugsModel drug) {
  //     Map drugs = drug.tomap();
  //     mydrugs.add(drugs);
  //   });
  //   return mydrugs;
  // }

  Future<void> putdrugs() async {
    emit(PutDrugsLoading());
    for (var i = 0; i < alldrugs.length; i++) {
      FirebaseFirestore.instance
          .collection('pharmacy')
          .doc(uId)
          .collection('MyDrugs')
          .doc()
          .set({
        'name': alldrugs[i].name,
        'price': alldrugs[i].price,
        'quantity': alldrugs[i].quantity,
        'usage': alldrugs[i].usage,
        'image': alldrugs[i].image,
        'uid': i
      }).then((value) {
        print('Doneee');
      }).catchError((error) {
        emit(PutDrugsError());
      });
    }
  }

  Future<void> getdruguid() {
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
        drugsuid.add(element.id);
      });
      uploadedruguid();
      print('Get Drugs success');
    }).catchError((error) {
      print(error.toString());
      emit(GetDrugUidError());
    });
  }

  void uploadedruguid() {
    FirebaseFirestore.instance
        .collection('pharmacy')
        .doc(uId)
        .set({'drugsuid': drugsuid}, SetOptions(merge: true)).then((value) {
      emit(UploadeDrugsUidSuccess());
    }).catchError((error) {
      emit(UploadeDrugsUidError());
    });
  }

  File? profileimage;

  Future<void> getimage() async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileimage = File(pickedFile.path);
      emit(Getprofileimagesuccess());
    } else {
      print('nothing selected');
      emit(GetprofileimageError());
    }
  }

  void updateimage(
      {required String collection,
      required String uid,
      required String image}) {
    emit(UpdateProfileImageLoading());
    FirebaseFirestore.instance
        .collection(collection)
        .doc(uid)
        .update({'image': image}).then((value) {
      emit(UploadeProfileImageSuccess());
    }).catchError((error) {
      emit(UpdateimageError());
    });
  }

  void uploadeimage({
    required String storage,
    required String collection,
    required String uid,
  }) {
    emit(UploadeProfileImageLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('$storage/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then(
        (value) {
          updateimage(collection: collection, uid: uid, image: value);
        },
      ).catchError((error) {
        emit(UploadeProfileImageError());
      });
    }).catchError((error) {
      emit(UploadeProfileImageError());
    });
  }
}
