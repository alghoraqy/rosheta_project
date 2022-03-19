import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('022247'),
      appBar: backappbar(context, title: 'Order Details'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        decoration: BoxDecoration(
            color: HexColor('#F8F8F8'),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                buildOrderItem(context, title: 'order 1'),
                buildOrderItem(context, title: 'order 2'),
                buildOrderItem(context, title: 'order 3'),
                buildOrderItem(context, title: 'order 4'),
                buildOrderItem(context, title: 'order 5'),
                buildOrderItem(context, title: 'order 6'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
