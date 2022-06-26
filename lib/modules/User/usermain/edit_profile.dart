import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/map/get_location_google_map.dart';

import '../../../Shared/variable.dart';

class EditProfile extends StatelessWidget {
  TextEditingController editnamecontroller = TextEditingController();
  TextEditingController editemailcontroller = TextEditingController();
  TextEditingController editphonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, states) {},
      builder: (context, states) {
        editnamecontroller.text = UserCubit.get(context).userModel!.name!;
        editemailcontroller.text = UserCubit.get(context).userModel!.email!;
        editphonecontroller.text = UserCubit.get(context).userModel!.phone!;
        editaddresscontroller.text = UserCubit.get(context).userModel!.address!;
        UserCubit cubit = UserCubit.get(context);
        return Scaffold(
          backgroundColor: HexColor('#022247'),
          appBar: backappbar(context, title: 'Edit Profile'),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      color: HexColor('#F8F8F8'),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          editprofileform(context,
                              controller: editnamecontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              controller: editemailcontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              controller: editphonecontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  child: editprofileform(context,
                                      controller: editaddresscontroller),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                flex: 1,
                                child: locatonmap(context, hexcolor: '#35C2DD',
                                    onPressed: () {
                                  navigateto(context, const GetMyLocation());
                                }),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              text: 'New Password',
                              secure: true,
                              controller: cubit.editpasswordcontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              text: 'Confirm Password',
                              secure: true,
                              controller: cubit.confirmeditpasswordcontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          userbutton(context,
                              text: 'Save Changes',
                              imageroute: 'assets/images/save.png',
                              onpressed: () {
                            cubit.updateUser(
                              name: editnamecontroller.text,
                              email: editemailcontroller.text,
                              phone: editphonecontroller.text,
                              address: editaddresscontroller.text,
                              latitude: latitude,
                              longitude: longitude,
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
