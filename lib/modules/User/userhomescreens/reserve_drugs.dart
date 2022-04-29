import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Models/pharmacymodel.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/usermain/order_details.dart';

class ReserveDrugs extends StatelessWidget {
  PharmacyModel? pharmacydata;
  ReserveDrugs({Key? key, required this.pharmacydata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#022247'),
      appBar: backappbar(context, title: '${pharmacydata!.name} Pharmacy'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 30),
        decoration: BoxDecoration(
            color: HexColor('#F8F8F8'),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.68,
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
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage('${pharmacydata!.image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${pharmacydata!.name}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor('#022247')),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(mansoura branch)',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#022247')),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Pharmacyprofile(
                              show: false,
                              icon: Icons.phone_in_talk_outlined,
                              text: pharmacydata!.phone!),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Pharmacyprofile(
                              show: false,
                              icon: Icons.location_on_outlined,
                              text: pharmacydata!.address!),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Pharmacyprofile(
                              icon: Icons.email_outlined,
                              text: pharmacydata!.email!),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Pharmacyprofile(
                              icon: Icons.event_available_rounded,
                              text:
                                  '${pharmacydata!.open!} Am : ${pharmacydata!.close!} Pm'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Pharmacyprofile(
                              icon: Icons.pedal_bike,
                              text: 'Available home delivery'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            premiumecard(context,
                text: 'Upgrade to premium to see all details'),
            Spacer(),
            userbutton(context,
                text: 'Reserve this drugs',
                imageroute: 'assets/images/reserve.png', onpressed: () {
              navigateto(context, OrderDetails());
            })
          ],
        ),
      ),
    );
  }
}
