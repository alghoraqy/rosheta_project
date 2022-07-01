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
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {}),
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
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                        onpressed: () {
                      navigateto(
                          context,
                          TrialArticleView(
                            imageroute:
                                'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                            title: 'Cuts and Scropes',
                          ));
                    }),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'Snake Bit',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/pexels-donald-tong-23817.jpg?alt=media&token=55fbe2fc-3e4b-4f92-836f-bc9f65413f6a',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'Snake Bit',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/pexels-donald-tong-23817.jpg?alt=media&token=55fbe2fc-3e4b-4f92-836f-bc9f65413f6a',
                        onpressed: () {}),
                    articleitem(context,
                        text: 'cuts and scropes',
                        imageroute:
                            'https://firebasestorage.googleapis.com/v0/b/rosheta-scanner.appspot.com/o/cuts.jpg?alt=media&token=2b8479a0-7899-4a66-a356-65521dc70fdf',
                        onpressed: () {}),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
