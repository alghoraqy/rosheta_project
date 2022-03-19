import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Shared/Components/components.dart';

class TrialArticleView extends StatelessWidget {
  late String imageroute;
  late String title;
  TrialArticleView({
    required this.imageroute,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    var scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: HexColor('#F8F8F8'),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageroute),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#1F3958')),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type orem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and electronic typesetting, remaining essentially unchanged :',
                    style: TextStyle(
                        height: 1.8,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: HexColor('#888888')),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  articlerow(context,
                      text: 'There is a proven fact from a long time.'),
                  articlerow(context,
                      text: 'That the readable content of a page.'),
                  articlerow(context,
                      text: 'The reader from focusing on the exterm.'),
                  articlerow(context,
                      text: 'Paragraphs placed on the page he.'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userbutton(context, onpressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 5,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Join us to find nearest hospital :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor('#022247'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                myDivider(context),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                TrialRegister(context),
                              ],
                            ),
                          ),
                        );
                      });
                  // scaffoldkey.currentState!.showBottomSheet((context) {
                  //   return Container(
                  //     width: double.infinity,
                  //     height: MediaQuery.of(context).size.height / 5,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(20),
                  //             topRight: Radius.circular(20))),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(15),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Join us to find nearest hospital :',
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w600,
                  //               color: HexColor('#022247'),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           myDivider(context),
                  //           SizedBox(
                  //             height: MediaQuery.of(context).size.height / 50,
                  //           ),
                  //           TrialRegister(context),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // });
                },
                    text: 'Nearest Hospital',
                    imageroute: 'assets/images/nearestpharmacy.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
