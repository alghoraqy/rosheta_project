import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Shared/Components/components.dart';

class TrialSearch extends StatelessWidget {
  const TrialSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#022247'),
      appBar: backappbar(context, title: 'Search'),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: HexColor('#F8F8F8'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Searchbox(context,
                    text: 'Search for drugs ...',
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {}),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Text(
                  'Popular Searches',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#A3AFBE')),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    popularsearch(text: 'panadol'),
                    popularsearch(text: 'vitamine'),
                    popularsearch(text: 'omega 3'),
                    popularsearch(text: 'zinc'),
                    popularsearch(text: 'Durex'),
                    popularsearch(text: 'Durex'),
                    popularsearch(text: 'Durex'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Text(
                  'Designed Drug',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#A3AFBE')),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(7.0, 6.0),
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://pharmacia1.com/wp-content/uploads/2015/09/panadol-extra.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Panadol Extra 500',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#022247')),
                                  ),
                                  Spacer(),
                                  Text(
                                    '35.5 LE',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#48BC98')),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                'One of the most popular medicines prescribed to treat colds and flu, thanks to the active ingredient paracetamol',
                                style: TextStyle(
                                    height: 1.8,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#69737E')),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Text(
                  'Suitable Drug',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#A3AFBE')),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                premiumecard(context, text: 'Upgrade To Premium'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Text(
                  'Join us to find nearest pharmacy:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: HexColor('#A3AFBE')),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                TrialRegister(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
