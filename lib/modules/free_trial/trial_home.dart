import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Shared/Components/components.dart';
import '../User/usermain/articleview.dart';
import 'TrialArticleView.dart';

class TrialHome extends StatelessWidget {
  const TrialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return layout(
        context,
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrialRegister(context),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Searchbox(
                      context,
                      text: 'Search ...',
                      width: 0,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
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
              Trialservices(context),
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
                      imageroute:
                          'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/pexels-donald-tong-23817.jpg?alt=media&token=55fbe2fc-3e4b-4f92-836f-bc9f65413f6a',
                      text: 'Snake Bit', onpressed: () {
                    navigateto(
                        context,
                        TrialArticleView(
                          imageroute:
                              'https://media.istockphoto.com/vectors/first-aid-snake-bite-on-her-arm-vector-id477912330?k=20&m=477912330&s=612x612&w=0&h=K3KO5vpKaoOlcSUKWDl6JenmBCE4oOcxp03_dNWMEas=',
                          title: 'Snake Bit',
                        ));
                  }),
                  Spacer(),
                  articleitem(context,
                      imageroute:
                          'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                      text: 'Cuts and Scrapes', onpressed: () {
                    navigateto(
                        context,
                        TrialArticleView(
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
  }
}
