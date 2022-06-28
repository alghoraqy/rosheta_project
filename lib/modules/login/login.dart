import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/LoginCubit/login_cubit.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymaster/pharmacymaster.dart';
import 'package:rosheta_project/modules/User/usermaster/usermaster.dart';
import 'package:rosheta_project/modules/login/joinus.dart';
import 'package:rosheta_project/modules/signUp/sign_up0.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {
        if (states is LoginFilterUser) {
          CashHelper.saveData(key: 'uId', value: states.uId).then((value) {
            CashHelper.saveData(key: 'isuser', value: true).then((value) {
              uId = states.uId;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return UserMaster();
              }));
            });
          });
        } else if (states is LoginFilterPharmacy) {
          CashHelper.saveData(key: 'uId', value: states.uId).then((value) {
            CashHelper.saveData(key: 'isuser', value: false).then((value) {
              uId = states.uId;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return PharmacyMaster();
              }));
            });
          });
        }
      },
      builder: (context, states) {
        var cubit = LoginCubit.get(context);
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return JoinUs();
                  }));
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
                    key: cubit.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginText(text: 'Login'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        defaultFormfield(
                          inputtype: TextInputType.emailAddress,
                          controller: cubit.emailcontroller,
                          secure: false,
                          hinttext: 'E-mail',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        defaultFormfield(
                          inputtype: TextInputType.visiblePassword,
                          controller: cubit.passwordcontroller,
                          secure: true,
                          hinttext: 'Password',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        LoginButton(context,
                            widget: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ), onpressed: () {
                          cubit.formkey.currentState!.validate()
                              ? cubit.userLogin(context,
                                  email: cubit.emailcontroller.text,
                                  password: cubit.passwordcontroller.text)
                              : null;
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forget Your Password ?',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
