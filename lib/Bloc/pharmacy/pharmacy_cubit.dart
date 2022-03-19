import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacyhome.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacyprofile.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacyreservation.dart';

class PharmacyCubit extends Cubit<PharmacyStates> {
  PharmacyCubit() : super(PharmacyInitialStates());
  PharmacyCubit get(context) => BlocProvider.of(context);

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
}
