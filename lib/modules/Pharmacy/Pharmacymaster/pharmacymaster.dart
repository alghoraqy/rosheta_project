import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';
import 'package:rosheta_project/modules/User/contactus.dart';
import 'package:rosheta_project/modules/User/upgrade.dart';
import 'package:rosheta_project/modules/User/usermaster/notifications.dart';
import 'package:rosheta_project/modules/mywallet.dart';

class PharmacyMaster extends StatelessWidget {
  const PharmacyMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PharmacyCubit cubit = PharmacyCubit.get(context);
        return cubit.myDrugs.isEmpty && cubit.pharmacyModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                key: cubit.scaffoldKey,
                backgroundColor: HexColor('#022247'),
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
                                cubit.scaffoldKey.currentState!.openEndDrawer();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
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
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                backgroundImage:
                                    NetworkImage(cubit.pharmacyModel!.image!),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                              Text(
                                cubit.pharmacyModel!.name!,
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                cubit.pharmacyModel!.phone!,
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
                                        text: 'Reservations',
                                        icon: Icons.person,
                                        onpressed: () {}),
                                    drawitem(
                                        text: 'My wallet',
                                        icon: Icons.wallet_travel,
                                        onpressed: () {
                                          navigateTo(context, MyWalletScreen());
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
                                        onpressed: () {})
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
                  items: cubit.items,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBotNav(index);
                  },
                ),
              );
      },
    );
  }
}
