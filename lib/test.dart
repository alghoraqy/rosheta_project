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