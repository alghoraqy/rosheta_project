import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/signUp/sign_up3.dart';

class SignUpPharmacy extends StatelessWidget {
  const SignUpPharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {
        if (states is CreateSuccessStates3) {
          CashHelper.saveData(key: 'uId', value: states.uId).then((value) {
            // uId = states.uId;
            navigateto(context, SignUp3());
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
                        LoginText(text: 'SignUp'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        signupforpharmacy(context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 7.45,
                        ),
                        LoginButton(context, text: 'Next', onpressed: () {
                          cubit.formkey3.currentState!.validate()
                              ? cubit.createpharmacy3(
                                  open: cubit.openincontroller.text,
                                  close: cubit.closeincontroller.text,
                                  uId: cubit.uid!)
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
