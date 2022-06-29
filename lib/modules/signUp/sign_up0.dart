import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/LoginCubit/login_cubit.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/signUp/sign_up1.dart';

class SignUp0 extends StatelessWidget {
  const SignUp0({Key? key}) : super(key: key);

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                  image: AssetImage('assets/images/secondlogo.png'),
                  width: MediaQuery.of(context).size.width),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginText(text: 'Sign Up'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        patientcard(context,
                            routeimage: 'assets/images/patient.png',
                            color: cubit.isuser
                                ? HexColor('#35C2DD').withOpacity(.3)
                                : HexColor('#F8F8F8').withOpacity(.2),
                            text: 'User',
                            hextextcolor: cubit.isuser ? '#35C2DD' : '#F8F8F8',
                            onpressed: () {
                          cubit.changeuser();
                        }),
                        patientcard(context,
                            routeimage: 'assets/images/pharmacist.png',
                            color: cubit.isuser
                                ? HexColor('#F8F8F8').withOpacity(.2)
                                : HexColor('#35C2DD').withOpacity(.3),
                            text: 'Pharmacy',
                            hextextcolor: cubit.isuser ? '#ffffff' : '#35C2DD',
                            onpressed: () {
                          cubit.changePharmacy();
                        }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8.5,
                    ),
                    LoginButton(context,
                        widget: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ), onpressed: () {
                      navigateto(context, SignUp1());
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
                  indicatorOff(),
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
        );
      },
    );
  }
}
