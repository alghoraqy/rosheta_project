import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/signUp/sign_up3.dart';

class SignUpUser extends StatelessWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {},
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
              key: cubit.formkey3,
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
                        Text(
                          'Do you suffer from any of these \ndiseases?',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#EAEAEA')),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            checkbox(context,
                                text: 'Pressure',
                                value: cubit.pressure, onchange: (value) {
                              cubit.changecheck1(value);
                            }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 60,
                            ),
                            checkbox(context,
                                text: 'Diabetes',
                                value: cubit.diabetes, onchange: (value) {
                              cubit.changecheck2(value);
                            }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 60,
                            ),
                            checkbox(context, text: 'Heart', value: cubit.heart,
                                onchange: (value) {
                              cubit.changecheck3(value);
                            }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 60,
                            ),
                            checkbox(context,
                                text: 'Chest Allergy',
                                value: cubit.chest, onchange: (value) {
                              cubit.changecheck4(value);
                            }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 60,
                            ),
                            checkbox(context,
                                text: 'Sinuses',
                                value: cubit.sinuses, onchange: (value) {
                              cubit.changecheck5(value);
                            }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 10,
                            ),
                          ],
                        ),
                        LoginButton(context, text: 'Next', onpressed: () {
                          cubit.formkey3.currentState!.validate()
                              ? navigateto(context, SignUp3())
                              : null;
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
                      indicatorOn(),
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
