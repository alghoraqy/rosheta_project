import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/variable.dart';
import 'package:rosheta_project/modules/map/map_screen.dart';
import 'package:rosheta_project/modules/signUp/%D9%8Dsign_upuser.dart';
import 'package:rosheta_project/modules/signUp/sign_up0.dart';
import 'package:rosheta_project/modules/signUp/sign_up3.dart';
import 'package:rosheta_project/modules/signUp/sign_uppharmacy.dart';

class SignUp2 extends StatelessWidget {
  SignUp2({Key? key}) : super(key: key);
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {
        if (states is CreateSuccessStates2) {
          RegisterCubit.get(context).isuser
              ? navigateto(context, SignUpUser())
              : navigateto(context, SignUpPharmacy());
        }
      },
      builder: (context, states) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Scaffold(
          backgroundColor: HexColor('#022247'),
          appBar: AppBar(
            leadingWidth: 0,
            leading: SizedBox(
              width: 20,
            ),
            title: actionbutton(
                icon: Icons.arrow_back_outlined,
                onpressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formkey2,
              child: Column(
                children: [
                  Image(
                      image: AssetImage('assets/images/secondlogo.png'),
                      width: MediaQuery.of(context).size.width),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginText(text: 'Sign Up'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: defaultFormfield(
                                      hinttext: 'Address',
                                      controller: cubit.isuser
                                          ? cubit.useraddresscontroller
                                          : cubit.pharmacyaddresscontroller,
                                      inputtype: TextInputType.name,
                                      secure: false,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: locatonmap(context,
                                        hexcolor: '#48BC98', onPressed: () {
                                      navigateto(context, MapScreen());
                                    }))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: cubit.isuser
                                  ? cubit.userphonecontroller
                                  : cubit.pharmacyphonecontroller,
                              onEditingComplete: () {
                                RegisterCubit.get(context).startTimer();
                              },
                              obscureText: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone Number must not be empty';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/egypt.png',
                                        ),
                                        height: 25,
                                        width: 25,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '+20',
                                        style: TextStyle(
                                            decorationThickness: 2,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                errorStyle:
                                    TextStyle(height: .8, color: Colors.red),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 15),
                                hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#AEB8C3')),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            recievecodefield(context),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            defaultFormfield(
                                hinttext: 'Code',
                                controller:
                                    RegisterCubit.get(context).codecontroller,
                                inputtype: TextInputType.number,
                                secure: true,
                                onsubmit: () {}),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        LoginButton(context, text: 'Next', onpressed: () {
                          if (formkey2.currentState!.validate()) {
                            if (cubit.isuser) {
                              cubit.createuser2(
                                  address: cubit.useraddresscontroller.text,
                                  phone: cubit.userphonecontroller.text,
                                  uId: cubit.uid!,
                                  lat: position == null
                                      ? 30.033333
                                      : position!.latitude,
                                  lng: position == null
                                      ? 31.233334
                                      : position!.longitude);
                            } else {
                              cubit.createpharmacy2(
                                  address: cubit.pharmacyaddresscontroller.text,
                                  phone: cubit.pharmacyphonecontroller.text,
                                  uId: cubit.uid!,
                                  lat: position!.latitude,
                                  lng: position!.longitude);
                            }
                          }
                          //   cubit.formkey2.currentState!.validate()? cubit.isuser?navigateto(context, SignUpUser()):navigateto(context, SignUpPharmacy()) :null;
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indicatorOn(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 90,
                      ),
                      indicatorOn(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 90,
                      ),
                      indicatorOn(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 90,
                      ),
                      indicatorOff(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 90,
                      ),
                      indicatorOff(),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
