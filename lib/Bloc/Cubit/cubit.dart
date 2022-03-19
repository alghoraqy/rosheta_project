import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/modules/User/usermain/userarticles.dart';
import 'package:rosheta_project/modules/User/usermain/userhome.dart';
import 'package:rosheta_project/modules/User/usermain/userprofile.dart';
class UserCubit extends Cubit<UserStates>{
  UserCubit() : super(InitStates());
  static UserCubit get(context){
    return BlocProvider.of(context);
  }
  var editpasswordcontroller = TextEditingController();
  var confirmeditpasswordcontroller = TextEditingController();

 bool specialpackage = true;

 void changespecial(){
   specialpackage = true;
   emit(ChangeSpecial());
 }
 void changepremium(){
   specialpackage = false;
   emit(ChangePremium());
 }

  int current=0;
List<BottomNavigationBarItem> navList=[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined,), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined), label: 'Articles'),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
];
void changenav(index){
current=index;
emit(ChageBottomNavState());
}
List<Widget> screens=[
 UserHome(),
 UserArticles(),
 UserProfile(),
];
var scaffoldkey=GlobalKey<ScaffoldState>();
}