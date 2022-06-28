import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/usermaster/usermaster.dart';
import 'package:rosheta_project/modules/free_trial/Hometrial.dart';
import 'package:rosheta_project/modules/free_trial/trial_home.dart';
import 'package:rosheta_project/modules/login/login.dart';
import 'package:rosheta_project/modules/signUp/sign_up0.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Icon(
          Icons.abc,
          color: HexColor('#022247'),
        ),
      ),
      backgroundColor: HexColor('#022247'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
                image: AssetImage('assets/images/5.png'),
                width: MediaQuery.of(context).size.width),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text(
              'Join Us',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 3,
              color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Text(
              'To make it easier \n to get your medicine',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  LoginButton(context,
                      widget: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ), onpressed: () {
                    navigateto(context, LoginScreen());
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      height: 55,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              BorderSide(width: 3, color: HexColor('#35C2DD'))),
                      textColor: Colors.white,
                      onPressed: () {
                        navigateto(context, const SignUp0());
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start a free trial',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor('#F8F8F8')),
                      ),
                      actionbutton(
                          icon: Icons.arrow_forward_outlined,
                          onpressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return TrialMaster();
                            }));
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
