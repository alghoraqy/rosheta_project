import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/signUp/onboarding.dart';
import 'package:rosheta_project/modules/signUp/sign_up2.dart';

class SignUp1 extends StatelessWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {},
      builder: (context, states) {
        RegisterCubit cubit =RegisterCubit.get(context);
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
                    key: cubit.formkey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginText(text: 'Sign Up'),
                         SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        registercomponent(context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        LoginButton(context, text: 'Next', onpressed: (){
                          cubit.formkey1.currentState!.validate()?navigateto(context, SignUp2()):null;
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
