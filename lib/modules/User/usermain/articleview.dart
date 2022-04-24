import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class ArticleView extends StatelessWidget {
  late String imageroute;
  late String title;
  late String body;
  ArticleView({
    required this.imageroute,
    required this.title,
    required this.body,
  });
  @override
  Widget build(BuildContext context) {
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
                    body,
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
                userbutton(context,
                    onpressed: () {},
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
