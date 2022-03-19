import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/Trialcubit/trial_states.dart';
import 'package:rosheta_project/modules/free_trial/trial_articles.dart';
import 'package:rosheta_project/modules/free_trial/trial_home.dart';

import '../../modules/User/usermain/userarticles.dart';
import '../../modules/User/usermain/userhome.dart';

class TrialCubit extends Cubit<TrialStates> {
  TrialCubit() : super(InitTrialStates());
  static TrialCubit get(context) {
    return BlocProvider.of(context);
  }

  List<BottomNavigationBarItem> navList = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.medical_services_outlined), label: 'Articles'),
  ];
  List<Widget> screens = [
    TrialHome(),
    TrialArticles(),
  ];
  int current = 0;
  void changenav(index) {
    current = index;
    emit(ChageBottomNavTrialState());
  }
}
