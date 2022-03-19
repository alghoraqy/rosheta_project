import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('022247'),
      appBar: backappbar(context, title: 'Order Details'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 30),
        decoration: BoxDecoration(
            color: HexColor('#F8F8F8'),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
                buildOrderItem(context, title: 'order 1'),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: MaterialButton(
                      elevation: 6,
                      padding: EdgeInsets.zero,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      color: HexColor('#48BC98'),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/add.png'),
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'add another drug',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: userbutton(context,
                          text: 'Submit Order',
                          onpressed: () {},
                          imageroute: 'assets/images/save.png')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
