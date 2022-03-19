import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class ContactUs extends StatelessWidget {
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#022247'),
      appBar: backappbar(context, title: 'Technical support'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: HexColor('#F8F8F8'),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: HexColor('#022247'),
                          ),
                        ),
                        Text(
                          'Leave your message and we will contact you',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: HexColor('#022247'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                editprofileform(context,
                    text: 'Full Name', controller: fullnamecontroller),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                editprofileform(context,
                    text: 'E-mail', controller: emailcontroller),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                editprofileform(context,
                    text: 'Phone number', controller: phonenumbercontroller),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                editprofileform(context,
                    text: ('Subject'), controller: subjectcontroller),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#FFFFFF'),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(7.0, 6.0),
                        )
                      ]),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 20),
                          child: TextFormField(
                            maxLines: 5,
                            autofocus: false,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#AEB8C3')),
                                hintText: 'Your Message ...',
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
               , SizedBox(height: MediaQuery.of(context).size.height/30,),
               userbutton(context, text: 'Send a message', imageroute: 'assets/images/send.png', onpressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
