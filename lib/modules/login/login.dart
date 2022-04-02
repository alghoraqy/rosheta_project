import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/LoginCubit/login_cubit.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/user/usermaster/usermaster.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {},
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
                        LoginButton(context, text: 'Login', onpressed: () {
                          cubit.formkey.currentState!.validate()
                              ? Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                  return UserMaster();
                                }))
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