import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/signUp/%D9%8Dsign_upuser.dart';
import 'package:rosheta_project/modules/signUp/sign_up0.dart';
import 'package:rosheta_project/modules/signUp/sign_up3.dart';
import 'package:rosheta_project/modules/signUp/sign_uppharmacy.dart';

class SignUp2 extends StatelessWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context,states){},
      builder: (context,states){
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
              child: Form(
                key: cubit.formkey2,
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
                          addresscompnent(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          LoginButton(context, text: 'Next', onpressed: (){
                            cubit.formkey2.currentState!.validate()? cubit.isuser?navigateto(context, SignUpUser()):navigateto(context, SignUpPharmacy()) :null;
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
