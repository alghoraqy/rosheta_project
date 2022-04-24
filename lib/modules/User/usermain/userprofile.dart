import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/usermain/edit_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
        listener: ((context, state) {}),
        builder: (context, states) {
          UserCubit cubit = UserCubit.get(context);
          return Scaffold(
            backgroundColor: HexColor('#022247'),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: MediaQuery.of(context).size.height / 12,
                              backgroundImage:
                                  NetworkImage(cubit.userModel!.image!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          color: HexColor('#F8F8F8'),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              profileitem(context,
                                  text: cubit.userModel!.name!),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                              profileitem(context,
                                  text: cubit.userModel!.email!),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                              profileitem(context,
                                  text: cubit.userModel!.phone!),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                              profileitem(context,
                                  text: cubit.userModel!.address!),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 6,
                              ),
                              userbutton(context,
                                  text: 'Edit Profile',
                                  imageroute: 'assets/images/edit.png',
                                  onpressed: () {
                                navigateto(context, EditProfile());
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
