import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/usermain/articleview.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return layout(
            context,
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      femalecircle(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Olivia',
                            style: TextStyle(
                                fontSize: 15, color: HexColor('#022247')),
                          ),
                          maintitle(text: 'Welcome Back')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Searchbox(
                          context,
                          text: 'Search ...', width: 0,
                          
                        ),
                      ),
                     SizedBox( width: 5,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 16,
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: HexColor('#022247'),
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  maintitle(text: 'Our Services'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 90,
                  ),
                  services(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  maintitle(text: 'First aid articles'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 90,
                  ),
                  Row(
                    children: [
                      articleitem(context,
                          imageroute: 'assets/images/snake.png',
                          text: 'Snake Bit', onpressed: () {
                        navigateto(
                            context,
                            ArticleView(
                              imageroute:
                                  'https://media.istockphoto.com/vectors/first-aid-snake-bite-on-her-arm-vector-id477912330?k=20&m=477912330&s=612x612&w=0&h=K3KO5vpKaoOlcSUKWDl6JenmBCE4oOcxp03_dNWMEas=',
                              title: 'Snake Bit',
                            ));
                      }),
                      Spacer(),
                      articleitem(context,
                          imageroute: 'assets/images/cuts.jpg',
                          text: 'Cuts and Scrapes', onpressed: () {
                        navigateto(
                            context,
                            ArticleView(
                              imageroute:
                                  'https://assets.aboutkidshealth.ca/AKHAssets/cuts_scrapes_children_first_aid.jpg?renditionid=21',
                              title: 'Cuts and Scropes',
                            ));
                      })
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
