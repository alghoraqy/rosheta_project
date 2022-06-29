import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymaster/pharmacymaster.dart';
import 'package:rosheta_project/modules/User/usermaster/usermaster.dart';

class SignUp3 extends StatelessWidget {
  const SignUp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, states) {
        if (states is GetAllDrugsSuccess) {
          RegisterCubit.get(context).putdrugs().then((value) {
            RegisterCubit.get(context).getdruguid().then((value) {
              navigateto(context, PharmacyMaster());
            });
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          LoginText(text: 'Sign Up'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            cubit.profileimage == null
                                ? CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 9,
                                    backgroundColor: Colors.white,
                                    backgroundImage: cubit.isuser
                                        ? NetworkImage(
                                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/female.png?alt=media&token=a2b02189-ab26-4dfb-ac7b-21ea0a9b4eed')
                                        : NetworkImage(
                                            'https://en.pimg.jp/065/798/123/1/65798123.jpg'),
                                  )
                                : CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 9,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        FileImage(cubit.profileimage!)),
                            FloatingActionButton(
                                backgroundColor: HexColor('#48BC98'),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                                onPressed: () {
                                  cubit.getimage().then((value) {
                                    cubit.uploadeimage(
                                        storage:
                                            cubit.isuser ? 'users' : 'pharmacy',
                                        collection:
                                            cubit.isuser ? 'users' : 'pharmacy',
                                        uid: uId!);
                                  });
                                }),
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 11,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                            padding: EdgeInsets.zero,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            color: HexColor('#48BC98'),
                            textColor: Colors.white,
                            onPressed: () {
                              cubit.isuser
                                  ? navigateto(context, UserMaster())
                                  : cubit.getAlldrugs();
                            },
                            child: states is UploadeProfileImageLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : states is UpdateProfileImageLoading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        'Confirm',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                      ),
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
                    indicatorOn(),
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
