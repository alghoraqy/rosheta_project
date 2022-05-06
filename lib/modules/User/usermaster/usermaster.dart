import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/User/contactus.dart';
import 'package:rosheta_project/modules/User/upgrade.dart';
import 'package:rosheta_project/modules/User/usermaster/notifications.dart';
import 'package:rosheta_project/modules/User/yourorders.dart';
import 'package:rosheta_project/modules/login/joinus.dart';
import 'package:rosheta_project/modules/login/login.dart';

class UserMaster extends StatelessWidget {
  const UserMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, states) {
        if (states is SignOutSuccessUser) {
          Phoenix.rebirth(context);
        }
      },
      builder: (context, states) {
        UserCubit cubit = UserCubit.get(context);
        return cubit.articles.isNotEmpty && cubit.userModel != null
            ? Scaffold(
                key: cubit.scaffoldkey,
                appBar: AppBar(
                  title: Image(
                    image: AssetImage(
                      'assets/images/secondlogo.png',
                    ),
                    width: MediaQuery.of(context).size.width / 3.8,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: Row(
                        children: [
                          actionbutton(
                              icon: Icons.notifications_active_outlined,
                              onpressed: () {
                                navigateto(context, Notifications());
                              }),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 100),
                          actionbutton(
                              icon: Icons.menu_outlined,
                              onpressed: () {
                                cubit.scaffoldkey.currentState!.openEndDrawer();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                body: cubit.screens[cubit.current],
                endDrawer: Drawer(
                  child: Container(
                    padding: EdgeInsetsDirectional.only(top: 20),
                    color: HexColor('#022247'),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    actionbutton(
                                        icon: Icons.arrow_back_outlined,
                                        onpressed: () {
                                          Navigator.pop(context);
                                        })
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 70,
                              ),
                              femalecircle(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Text(
                                cubit.userModel!.name!,
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                cubit.userModel!.phone!,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    drawitem(
                                        text: 'Your Orders',
                                        icon: Icons.person,
                                        onpressed: () {
                                          navigateTo(context, YourOrders());
                                        }),
                                    drawitem(
                                        text: 'Language',
                                        icon: Icons.translate,
                                        onpressed: () {}),
                                    drawitem(
                                        text: 'Invite Friends',
                                        icon: Icons.person_add,
                                        onpressed: () {}),
                                    drawitem(
                                        text: 'Contact Us',
                                        icon: Icons.headset_mic_outlined,
                                        onpressed: () {
                                          navigateto(context, ContactUs());
                                        }),
                                    myDivider(context),
                                    socialdrawitem(context,
                                        text: 'Upgrade to premium',
                                        imageroute:
                                            'assets/images/upgrade2.png',
                                        onpressed: () {
                                      navigateTo(context, UpgradeScreen());
                                    }),
                                    myDivider(context),
                                    socialdrawitem(context,
                                        text: 'Facebook',
                                        imageroute:
                                            'assets/images/facebook.png',
                                        onpressed: () {}),
                                    MaterialButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        leading: Image(
                                          image: AssetImage(
                                              'assets/images/twitter.png'),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9,
                                        ),
                                        title: Text(
                                          'Twitter',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    socialdrawitem(context,
                                        text: 'Google',
                                        imageroute: 'assets/images/google.png',
                                        onpressed: () {}),
                                    myDivider(context),
                                    drawitem(
                                        text: 'Logout',
                                        icon: Icons.logout_outlined,
                                        onpressed: () {
                                          cubit.signOut(context);
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.current,
                  items: cubit.navList,
                  onTap: (index) {
                    cubit.changenav(index);
                  },
                ),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: HexColor('#022247'),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
      },
    );
  }
}
