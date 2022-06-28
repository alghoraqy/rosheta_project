import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/signUp/sign_up2.dart';

class SignUp1 extends StatelessWidget {
  SignUp1({Key? key}) : super(key: key);
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {
        if (states is CreateSuccessStates) {
          CashHelper.saveData(key: 'uId', value: states.uId).then((value) {
            CashHelper.saveData(
                key: 'isuser',
                value: RegisterCubit.get(context).isuser ? true : false);
            uId = states.uId;
            navigateto(context, SignUp2());
          });
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
            child: Column(
              children: [
                Image(
                    image: AssetImage('assets/images/secondlogo.png'),
                    width: MediaQuery.of(context).size.width),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: formkey1,
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
                            defaultFormfield(
                              hinttext: 'Full Name',
                              controller: cubit.isuser
                                  ? cubit.userfullNamecontroller
                                  : cubit.pharmacyfullNamecontroller,
                              inputtype: TextInputType.name,
                              secure: false,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            defaultFormfield(
                              hinttext: 'E-mail',
                              controller: cubit.isuser
                                  ? cubit.useremailregistercontroller
                                  : cubit.pharmacyemailregistercontroller,
                              inputtype: TextInputType.emailAddress,
                              secure: false,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            defaultFormfield(
                              hinttext: 'Password',
                              controller: cubit.isuser
                                  ? cubit.userpasswordregistercontroller
                                  : cubit.pharmacypasswordregistercontroller,
                              inputtype: TextInputType.visiblePassword,
                              secure: true,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            defaultFormfield(
                              hinttext: 'Confirm Password',
                              controller: cubit.isuser
                                  ? cubit.userpasswordconfirmcontroller
                                  : cubit.pharmacypasswordconfirmcontroller,
                              inputtype: TextInputType.name,
                              secure: true,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        LoginButton(context,
                            widget: states is Loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ), onpressed: () {
                          formkey1.currentState!.validate()
                              ? cubit.isuser
                                  ? cubit.userregister(
                                      email: cubit
                                          .useremailregistercontroller.text,
                                      name: cubit.userfullNamecontroller.text,
                                      password: cubit
                                          .userpasswordregistercontroller.text)
                                  : cubit.pharmacyregister(
                                      email: cubit
                                          .pharmacyemailregistercontroller.text,
                                      name:
                                          cubit.pharmacyfullNamecontroller.text,
                                      password: cubit
                                          .pharmacypasswordregistercontroller
                                          .text)
                              : null;
                        })
                      ],
                    ),
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
                    indicatorOff(),
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
        );
      },
    );
  }
}
