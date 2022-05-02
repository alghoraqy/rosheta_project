import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildIcon({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return FloatingActionButton.small(
    heroTag: null,
    onPressed: onPressed,
    child: Icon(
      icon,
      color: Colors.white,
      size: 26,
    ),
    backgroundColor: HexColor('#465C76'),
  );
}

Widget searchBox(context,
    {IconData? icon, String text = 'Search', VoidCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          spreadRadius: 0,
          blurRadius: 7,
          offset: const Offset(0, 6.0),
        ),
      ]),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        onTap: onTap,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.zero,
          hintText: text,
          hintStyle: Theme.of(context).textTheme.overline,
          prefixIcon: Icon(
            icon,
            color: Colors.grey.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}

Widget buildTextFormField(context,
    {String? text,
    var style,
    double? width,
    TextEditingController? controller,
    double? padding = 20}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding!),
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          spreadRadius: 0,
          blurRadius: 7,
          offset: const Offset(0, 6.0),
        ),
      ]),
      width: width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: text,
          hintStyle: style,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}

Widget buildListTileItemWithIcon(
  context, {
  required IconData icon,
  required text,
  required VoidCallback onTap,
}) {
  return MaterialButton(
    onPressed: () {},
    child: ListTile(
      leading: Icon(
        icon,
        color: HexColor('AEB8C3'),
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: HexColor('AEB8C3'),
            ),
      ),
    ),
  );
}

// Widget myDivider(context) {
//   return Container(
//     height: 1,
//     width: MediaQuery.of(context).size.width,
//     color: HexColor('707070').withOpacity(.2),
//   );
// }

Widget buildListTileItemWithImage(
  context, {
  required String image,
  required text,
  required VoidCallback onTap,
}) {
  return MaterialButton(
    onPressed: () {},
    child: ListTile(
      leading: Image(
        image: NetworkImage(image),
        width: 25,
        height: 25,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: HexColor('AEB8C3'),
            ),
      ),
    ),
  );
}

Widget buildBottom(
  context, {
  required VoidCallback onPressed,
  IconData icon = Icons.add,
  required String text,
  Color color = Colors.lightBlueAccent,
  double width = 152,
}) {
  return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12),
            )
          ],
        ),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));
}

Widget buildShadow({Color color = Colors.grey}) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: color,
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(6.0, 6.0), // changes position of shadow
      )
    ]),
  );
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget buildOrderItem(context, {required String title}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          spreadRadius: 0,
          blurRadius: 7,
          offset: const Offset(0, 6.0),
        )
      ]),
      child: ExpansionTileCard(
        title: Text(title),
        contentPadding: const EdgeInsets.only(left: 5, right: 10),
        borderRadius: BorderRadius.circular(10),
        initialPadding: EdgeInsets.zero,
        baseColor: Colors.white,
        expandedColor: Colors.white,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      'Mohamed Hussein',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'Phone: ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Expanded(
                      child: Text(
                        '+201020337979',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Receiving method: ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      'Home Delivery',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'Location : ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Expanded(
                      child: Text(
                        'name of street, 25',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Receiving time: ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '25 jun 2021 , 5:10 PM',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Item',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          'Item Name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                        Text(
                          'Item Name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          'Item Price',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                        Text(
                          'Item Price',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Quantity',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          'Item Quantity',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                        Text(
                          'Item Quantity',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          'total ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                        Text(
                          'total ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileItem(context,
    {required String text, double width = double.infinity}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: MediaQuery.of(context).size.height / 15,
    width: width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.5),
        spreadRadius: 0,
        blurRadius: 7,
        offset: const Offset(7.0, 6.0),
      )
    ], color: HexColor('#FFFFFF'), borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: HexColor('#022247')),
          ),
        )
      ],
    ),
  );
}
