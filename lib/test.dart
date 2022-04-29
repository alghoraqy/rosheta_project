// Drawer(
//             child: Container(
//               color: HexColor('#022247'),
//               child: ListView(
//                 physics: const BouncingScrollPhysics(),
//                 children: [
//                   SafeArea(
//                     child: Padding(
//                       padding: const EdgeInsets.only( top: 10),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 15),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 buildIcon(
//                                   icon: Icons.arrow_back_outlined,
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const CircleAvatar(
//                             radius: 35,
//                             backgroundImage: NetworkImage(
//                                 'https://s3-eu-west-1.amazonaws.com/forasna/uploads/logos/clogo_2018-08-02-13-32-50_b7tjXmVP4Tt4ZIiZnqD8wgXX.jpg'),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 15),
//                             child: Text(
//                               'EL Tarshoby',
//                               style: Theme.of(context).textTheme.headline1,
//                             ),
//                           ),
//                           Text(
//                             '1968',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText2!
//                                 .copyWith(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 25),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               height:MediaQuery.of(context).size.height-290 ,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(20)
//                               ),
//                               child: Column(
//                                 children: [
//                                   buildListTileItemWithIcon(context,icon: Icons.article_outlined, text:'Your Order', onTap: (){}),
//                                   buildListTileItemWithIcon(context,icon: Icons.language, text:'Language', onTap: (){}),
//                                   buildListTileItemWithIcon(context,icon: Icons.person_add_sharp, text:'invite Friends', onTap: (){}),
//                                   myDivider(context),
//                                   buildListTileItemWithImage(context, image: 'https://cdn-icons-png.flaticon.com/128/145/145802.png', text: 'Facebook', onTap: (){}),
//                                   buildListTileItemWithImage(context, image: 'https://cdn.icon-icons.com/icons2/1211/PNG/128/1491579542-yumminkysocialmedia22_83078.png', text: 'Twitter', onTap: (){}),
//                                   buildListTileItemWithImage(context, image: 'https://cdn-icons-png.flaticon.com/128/281/281764.png', text: 'Google', onTap: (){}),
//                                   myDivider(context),
//                                   buildListTileItemWithIcon(context,icon: Icons.logout, text:'Log out', onTap: (){}),
//                                 ],

//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),



//drus

// [
//                           DataRow(cells: [
//                             DataCell(Image(
//                               image: NetworkImage(cubit.alldrugs[0].image!),
//                               width: 40,
//                               height: 30,
//                             )),
//                             DataCell(Text(
//                               cubit.alldrugs[0].name!,
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Text(
//                               '${cubit.alldrugs[0].price!}',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Text(
//                               '${cubit.alldrugs[0].quantity!}',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                           DataRow(cells: [
//                             const DataCell(Image(
//                               image: NetworkImage(
//                                   'https://cdn-icons-png.flaticon.com/128/822/822143.png'),
//                               width: 40,
//                               height: 30,
//                             )),
//                             const DataCell(Text(
//                               'panadol',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             const DataCell(Text(
//                               '50',
//                               style: TextStyle(fontSize: 10),
//                             )),
//                             DataCell(Row(
//                               children: const [
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/edit.png',
//                                   ),
//                                   color: Colors.green,
//                                   height: 25,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                     'assets/images/delete.png',
//                                   ),
//                                   color: Colors.red,
//                                   height: 25,
//                                 ),
//                               ],
//                             )),
//                           ]),
//                         ],
// .

////////////////////////////////////
///
///
///GridView.count(
                                    // crossAxisCount: 2,
                                    // childAspectRatio: 1.1,
                                    // crossAxisSpacing: 5,
                                    // mainAxisSpacing: 15,
                                  //   children: [
                                  //     pharmacycard(context, onpressed: () {
                                  //       navigateto(
                                  //           context,
                                  //           ReserveDrugs(
                                  //             title: 'Al Azaby',
                                  //             branch: 'Gehan',
                                  //           ));
                                  //     },
                                  //         imageroute:
                                  //             'https://1.bp.blogspot.com/-ocKAl4fI-y8/Xz6ifYTrcjI/AAAAAAAAAV0/LhbaTb5ihGIOMmudMitpHcGfm97CDyzsQCLcBGAsYHQ/s330/elezaby.png',
                                  //         title: 'Al zaby',
                                  //         branch: 'Gehan'),
                                  //     pharmacycard(context, onpressed: () {
                                  //       navigateto(
                                  //           context,
                                  //           ReserveDrugs(
                                  //             title: 'El Tarshoby',
                                  //             branch: 'Gehan',
                                  //           ));
                                  //     },
                                  //         imageroute:
                                  //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGCYqqCDSE4TaE9vinOBl-w0XhUpnhRqktQRn77wml0XARAsc1cdEXSsJ0tgQYny87R8o&usqp=CAU',
                                  //         title: 'El tarshoby',
                                  //         branch: 'Gehan'),
                                  //     pharmacycard(context,
                                  //         onpressed: () {},
                                  //         imageroute:
                                  //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGCYqqCDSE4TaE9vinOBl-w0XhUpnhRqktQRn77wml0XARAsc1cdEXSsJ0tgQYny87R8o&usqp=CAU',
                                  //         title: 'El tarshoby',
                                  //         branch: 'Gehan'),
                                  //   ],
                                  // ),

