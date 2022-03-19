import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../User/usermain/articleview.dart';
import 'TrialArticleView.dart';

class TrialArticles extends StatelessWidget {
  const TrialArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return layout(
        context,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Searchbox(context,
                  text: 'Search in articles ...',
                  width: MediaQuery.of(context).size.width),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.15,
                  children: [
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute: 'assets/images/cuts.jpg', onpressed: () {
                      navigateto(
                          context,
                          TrialArticleView(
                            imageroute:
                                'https://assets.aboutkidshealth.ca/AKHAssets/cuts_scrapes_children_first_aid.jpg?renditionid=21',
                            title: 'Cuts and Scropes',
                          ));
                    }),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute: 'assets/images/cuts.jpg',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute: 'assets/images/cuts.jpg',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'Snake Bit',
                        imageroute: 'assets/images/snake.png',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute: 'assets/images/cuts.jpg',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute: 'assets/images/cuts.jpg',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'Snake Bit',
                        imageroute: 'assets/images/snake.png',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute: 'assets/images/cuts.jpg',
                        onpressed: () {}),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
