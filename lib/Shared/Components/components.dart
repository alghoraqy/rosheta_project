import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';
import 'package:rosheta_project/modules/User/upgrade.dart';
import 'package:rosheta_project/modules/User/userhomescreens/search.dart';
import 'package:rosheta_project/modules/free_trial/TrialSearch.dart';
import 'package:rosheta_project/modules/login/login.dart';
import 'package:rosheta_project/modules/signUp/sign_up0.dart';

Widget actionbutton({required IconData icon, required VoidCallback onpressed}) {
  return FloatingActionButton.small(
    heroTag: null,
    onPressed: onpressed,
    child: Icon(
      icon,
      color: Colors.white,
      size: 28,
    ),
    backgroundColor: HexColor('#465C76'),
  );
}

Widget maintitle({
  required String text,
}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: HexColor('#022247')),
  );
}

Widget serviceitem(
  context, {
  required VoidCallback onpressed,
  required String text,
  required String imageroute,
  required String hexcolor,
  required Color seccolor,
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.25,
    height: MediaQuery.of(context).size.height / 8,
    child: MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: HexColor(hexcolor),
      onPressed: onpressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(25),
            shadowColor: Colors.grey.withOpacity(.5),
            elevation: 2,
            child: CircleAvatar(
              backgroundColor: seccolor,
              radius: 25,
              child: Image(
                image: AssetImage(imageroute),
                height: 28,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    ),
  );
}

Widget services(context) {
  return Column(
    children: [
      Row(
        children: [
          serviceitem(context,
              text: 'Search For Drugs',
              imageroute: 'assets/images/drugs.png',
              hexcolor: '#48BC98',
              seccolor: HexColor('#46C69F'), onpressed: () {
            navigateto(context, SearchForDrugs());
          }),
          Spacer(),
          serviceitem(context,
              text: 'Prescription Scanner',
              imageroute: 'assets/images/scan.png',
              hexcolor: '#35C2DD',
              seccolor: HexColor('#73CEE0'),
              onpressed: () {}),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 70,
      ),
      Row(
        children: [
          serviceitem(context,
              text: 'Reserve Your Drugs',
              imageroute: 'assets/images/reserve.png',
              hexcolor: '#35C2DD',
              seccolor: HexColor('#73CEE0'),
              onpressed: () {}),
          Spacer(),
          serviceitem(context,
              text: 'Nearest Phamacy',
              imageroute: 'assets/images/nearestpharmacy.png',
              hexcolor: '#48BC98',
              seccolor: HexColor('#46C69F'),
              onpressed: () {}),
        ],
      ),
    ],
  );
}

Widget articleitem(
  context, {
  required String text,
  required String imageroute,
  required VoidCallback onpressed,
}) {
  return MaterialButton(
    elevation: .3,
    color: HexColor('#ffffff'),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.zero,
    onPressed: onpressed,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.25,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageroute)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: HexColor('#022247'),
            ),
          ),
        )
      ],
    ),
  );
}

Widget femalecircle() {
  return Container(
    decoration:
        BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(.5),
          spreadRadius: 0,
          blurRadius: 8,
          offset: Offset(6.0, 6.0))
    ]),
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 40,
      child: Image(
        image: AssetImage('assets/images/female.png'),
        height: 65,
      ),
    ),
  );
}

Widget drawitem({
  Color textcolor = Colors.black,
  required String text,
  IconData? icon,
  required VoidCallback onpressed,
  bool isImage = false,
  String? image,
}) {
  return MaterialButton(
    height: 20,
    padding: EdgeInsets.zero,
    onPressed: onpressed,
    child: ListTile(
      leading: isImage == true
          ? Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SvgPicture.asset(
                image!,
                color: HexColor(
                  '#022247',
                ),
                width: 25,
              ),
            )
          : Icon(
              icon,
              size: 35,
              color: HexColor('#022247'),
            ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: textcolor),
      ),
    ),
  );
}

Widget myDivider(context) {
  return Container(
    height: 1,
    color: Colors.grey.shade400,
    width: MediaQuery.of(context).size.width,
  );
}

Widget socialdrawitem(
  context, {
  required String text,
  required String imageroute,
  required VoidCallback onpressed,
}) {
  return MaterialButton(
    padding: EdgeInsets.zero,
    onPressed: onpressed,
    child: ListTile(
      leading: Image(
        image: AssetImage(imageroute),
        height: MediaQuery.of(context).size.height / 13,
        width: MediaQuery.of(context).size.width / 13,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
  );
}

Widget LoginButton(context,
    {required Widget widget, required VoidCallback onpressed}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      padding: EdgeInsets.zero,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      color: HexColor('#48BC98'),
      textColor: Colors.white,
      onPressed: onpressed,
      child: widget,
    ),
  );
}

void navigateto(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

Widget LoginText({required String text}) {
  return Text(
    '$text',
    style: TextStyle(
        fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
  );
}

Widget Searchbox(
  context, {
  required String text,
  required double width,
  VoidCallback? onPressed,
  ValueChanged<String>? onchange,
  TextEditingController? controller,
}) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.5),
        spreadRadius: 0,
        blurRadius: 7,
        offset: Offset(7.0, 6.0),
      )
    ]),
    width: width,
    child: TextFormField(
      controller: controller,
      onTap: onPressed,
      onChanged: onchange,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.zero,
        hintText: text,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

Widget defaultFormfield(
    {required String hinttext,
    required TextEditingController controller,
    required TextInputType inputtype,
    required bool secure,
    VoidCallback? onsubmit,
    Widget? prefix}) {
  return Container(
    child: TextFormField(
      keyboardType: inputtype,
      controller: controller,
      onEditingComplete: onsubmit,
      obscureText: secure,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hinttext must not be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        prefix: prefix,
        errorStyle: TextStyle(height: .8, color: Colors.red),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: HexColor('#AEB8C3')),
        fillColor: Colors.white,
        filled: true,
        hintText: hinttext,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(13)),
      ),
    ),
  );
}

Widget socialbutton(
  context, {
  required String imageroute,
  required VoidCallback onpressed,
}) {
  return MaterialButton(
    height: MediaQuery.of(context).size.height / 16,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    onPressed: onpressed,
    child: Image(
      image: AssetImage(imageroute),
      height: 33,
      width: 33,
    ),
  );
}

Widget patientcard(
  context, {
  required String routeimage,
  required Color color,
  required String text,
  required String hextextcolor,
  required VoidCallback onpressed,
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.45,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height / 5,
      color: color,
      onPressed: onpressed,
      child: Column(
        children: [
          Image(
            image: AssetImage(routeimage),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: HexColor(hextextcolor)),
          )
        ],
      ),
    ),
  );
}

Widget registercomponent(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      defaultFormfield(
        hinttext: 'Full Name',
        controller: RegisterCubit.get(context).userfullNamecontroller,
        inputtype: TextInputType.name,
        secure: false,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      defaultFormfield(
        hinttext: 'E-mail',
        controller: RegisterCubit.get(context).useremailregistercontroller,
        inputtype: TextInputType.emailAddress,
        secure: false,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      defaultFormfield(
        hinttext: 'Password',
        controller: RegisterCubit.get(context).userpasswordregistercontroller,
        inputtype: TextInputType.visiblePassword,
        secure: true,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      defaultFormfield(
        hinttext: 'Confirm Password',
        controller: RegisterCubit.get(context).userpasswordconfirmcontroller,
        inputtype: TextInputType.name,
        secure: true,
      ),
    ],
  );
}

Widget recievecodefield(context) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 80),
    height: 55,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              'You will Recieve a code...',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: HexColor('#F8F8F8')),
            ),
            Spacer(),
            Text(
              '00:${RegisterCubit.get(context).start}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: HexColor('#48BC98'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          color: HexColor('#48BC98'),
        )
      ],
    ),
  );
}

Widget addresscompnent(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              child: defaultFormfield(
                hinttext: 'Address',
                controller: RegisterCubit.get(context).useraddresscontroller,
                inputtype: TextInputType.name,
                secure: false,
              ),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 1,
              child: locatonmap(context, hexcolor: '#48BC98', onPressed: () {}))
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      TextFormField(
        keyboardType: TextInputType.phone,
        controller: RegisterCubit.get(context).userphonecontroller,
        onEditingComplete: () {
          RegisterCubit.get(context).startTimer();
        },
        obscureText: false,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Phone Number must not be empty';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/egypt.png',
                  ),
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '+20',
                  style: TextStyle(
                      decorationThickness: 2,
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )
              ],
            ),
          ),
          errorStyle: TextStyle(height: .8, color: Colors.red),
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: HexColor('#AEB8C3')),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Phone Number',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(13)),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      recievecodefield(context),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      defaultFormfield(
          hinttext: 'Code',
          controller: RegisterCubit.get(context).codecontroller,
          inputtype: TextInputType.number,
          secure: true,
          onsubmit: () {}),
    ],
  );
}

Widget locatonmap(context,
    {required String hexcolor, required VoidCallback onPressed}) {
  return Container(
    height: MediaQuery.of(context).size.height / 15,
    child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        color: HexColor(hexcolor),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/nearestpharmacy.png'),
              height: 25,
              width: 25,
              color: Colors.white,
            ),
            Text(
              'locat on map',
              style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            )
          ],
        )),
  );
}

Widget signupforpharmacy(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: defaultFormfield(
                  hinttext: 'Open In',
                  controller: RegisterCubit.get(context).openincontroller,
                  inputtype: TextInputType.datetime,
                  secure: false)),
          Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: defaultFormfield(
                  hinttext: 'Close In',
                  controller: RegisterCubit.get(context).closeincontroller,
                  inputtype: TextInputType.datetime,
                  secure: false)),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 20,
      ),
      Text(
        'Do you have home delivery?',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor('#EAEAEA')),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: RegisterCubit.get(context).radio.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                RegisterCubit.get(context).radioBottomCheck(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: RegisterCubit.get(context).radio[index]
                            ['is_selected']
                        ? HexColor('#F8F8F8')
                        : HexColor('#C6C6C6'),
                    radius: 10,
                    child: Center(
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: RegisterCubit.get(context).radio[index]
                                ['is_selected']
                            ? HexColor('#48BC98')
                            : HexColor('#AEB8C3'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    RegisterCubit.get(context).radio[index]['name'],
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#EAEAEA')),
                  ),
                ],
              ));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
      ),
    ],
  );
}

Widget radiobutton(
  context, {
  required String text,
  required int value,
}) {
  return RadioListTile(
      contentPadding: EdgeInsets.zero,
      activeColor: HexColor('#48BC98'),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: HexColor('#EAEAEA')),
      ),
      value: value,
      groupValue: RegisterCubit.get(context).val,
      onChanged: (value) {
        RegisterCubit.get(context).onchangeradio(value);
      });
}

Widget layout(
  context,
  Widget widget, {
  @required AppBar? appBar,
}) {
  return Scaffold(
    appBar: appBar,
    backgroundColor: HexColor('#022247'),
    body: Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: HexColor('#F8F8F8'), borderRadius: BorderRadius.circular(30)),
      child: widget,
    ),
  );
}

Widget articlerow(
  context, {
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: HexColor('#32C2E3'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 80,
            ),
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: HexColor('#707070')),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
      ],
    ),
  );
}

Widget userbutton(
  context, {
  required String text,
  required String imageroute,
  required VoidCallback onpressed,
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.5,
    child: MaterialButton(
      elevation: 6,
      padding: EdgeInsets.zero,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      color: HexColor('#35C2DD'),
      textColor: Colors.white,
      onPressed: onpressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imageroute),
            height: 15,
            width: 15,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileitem(context, {required String text}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: MediaQuery.of(context).size.height / 15,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.5),
        spreadRadius: 0,
        blurRadius: 7,
        offset: Offset(7.0, 6.0),
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

Widget editprofileform(
  context, {
  String? text,
  required TextEditingController controller,
  bool secure = false,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: MediaQuery.of(context).size.height / 15,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.5),
        spreadRadius: 0,
        blurRadius: 7,
        offset: Offset(7.0, 6.0),
      )
    ], color: HexColor('#FFFFFF'), borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      obscureText: secure,
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: HexColor('#022247')),
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: HexColor('#AEB8C3')),
          hintText: text),
    ),
  );
}

PreferredSizeWidget backappbar(context, {required String title}) {
  return AppBar(
    leadingWidth: 0,
    leading: SizedBox(
      width: 20,
    ),
    title: Row(
      children: [
        actionbutton(
            icon: Icons.arrow_back_outlined,
            onpressed: () {
              Navigator.pop(context);
            }),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ],
    ),
  );
}

Widget pharmacycard(
  context, {
  required VoidCallback onpressed,
  required String imageroute,
  required String title,
  required double distance,
  String branch = 'mansoura',
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.35,
    child: MaterialButton(
      elevation: 5,
      color: HexColor('#ffffff'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.zero,
      onPressed: onpressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.35,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageroute)),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#022247'),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        '($branch branch)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: HexColor('#022247')),
                      ),
                    )
                  ],
                ),
                Text('Distance : $distance m',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: HexColor('#022247')))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class Pharmacy extends StatelessWidget {
  late String title;
  late String branch;
  late VoidCallback onpressed;
  late String imageroute;
  Pharmacy({
    required this.title,
    required this.branch,
    required this.onpressed,
    required this.imageroute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.35,
      child: MaterialButton(
        elevation: 5,
        color: HexColor('#ffffff'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.zero,
        onPressed: onpressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.35,
              height: MediaQuery.of(context).size.height / 7,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageroute)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#022247'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      '($branch branch)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: HexColor('#022247')),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildOrderItem(context, {required String title}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
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
        contentPadding: EdgeInsets.only(left: 5, right: 10),
        borderRadius: BorderRadius.circular(10),
        initialPadding: EdgeInsets.zero,
        baseColor: Colors.white,
        expandedColor: Colors.white,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                    Text(
                      '+201020337979',
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
                      'Location:',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text(
                        'name of street, 25',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
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
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Order status :',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#022247')),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Delivered',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 15,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ratebutton(context, text: 'Rate', hexcolor: '#48BC98',
                        onpressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rate :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: HexColor('#022247'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    myDivider(context),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              size: 50,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                              Icons.star_border_outlined,
                                              size: 50,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                              Icons.star_border_outlined,
                                              size: 50,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                              Icons.star_border_outlined,
                                              size: 50,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                              Icons.star_border_outlined,
                                              size: 50,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: TextFormField(
                                            maxLines: 2,
                                            autofocus: false,
                                            style: TextStyle(fontSize: 20),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintStyle: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w300,
                                                  color: HexColor('#AEB8C3')),
                                              hintText: 'Your Message ...',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: ratebutton(context,
                                              text: 'Send',
                                              hexcolor: '#48BC98',
                                              onpressed: () {}),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                    SizedBox(
                      width: 20,
                    ),
                    ratebutton(context, text: 'Rebort', hexcolor: '#D2203D',
                        onpressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rebort :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: HexColor('#022247'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    myDivider(context),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: TextFormField(
                                            maxLines: 2,
                                            autofocus: false,
                                            style: TextStyle(fontSize: 20),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintStyle: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w300,
                                                  color: HexColor('#AEB8C3')),
                                              hintText: 'Your comment ...',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: ratebutton(context,
                                              text: 'Send',
                                              hexcolor: '#D2203D',
                                              onpressed: () {}),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Pharmacyprofile({
  required IconData icon,
  required String text,
  bool show = true,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 24,
        color: HexColor('#48BC98'),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: show ? null : TextDecoration.lineThrough,
              color: HexColor('#022247')),
        ),
      )
    ],
  );
}

Widget indicatorOn() {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
        color: HexColor('022247'),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: HexColor('48BC98'))),
    child: Center(
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: HexColor('48BC98'),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget indicatorOff() {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
        color: HexColor('022247'),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: HexColor('AEB8C3'))),
    child: Center(
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: HexColor('AEB8C3'),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget checkbox(
  context, {
  required String text,
  required bool value,
  required ValueChanged onchange,
}) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 20,
        child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(
              color: Colors.white,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            checkColor: Colors.white,
            activeColor: HexColor('#48BC98'),
            value: value,
            onChanged: onchange),
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        text,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: HexColor('#EAEAEA')),
      )
    ],
  );
}

Widget notificationBox(
  context, {
  required String title,
  required String text,
  required IconData icon,
  required String color,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.5),
        spreadRadius: 0,
        blurRadius: 7,
        offset: Offset(7.0, 6.0),
      )
    ], color: HexColor('#FFFFFF'), borderRadius: BorderRadius.circular(15)),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 6.5,
    child: Row(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: HexColor(color),
          child: Icon(
            icon,
            size: 40,
            color: HexColor('#FFFFFF'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#022247')),
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: HexColor('#022247')),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget successbox(context) {
  return notificationBox(context,
      title: 'Your order reserved successfully',
      text: 'You can get directions to pharmacy and receive it now',
      icon: Icons.check,
      color: '#48BC98');
}

Widget failedbox(context) {
  return notificationBox(context,
      title: 'Your order rejected',
      text: 'please check your correct data and try again',
      icon: Icons.close,
      color: '#F85C5C');
}

Widget importantbox(context) {
  return notificationBox(context,
      title: 'Important notice',
      text: 'Please update your profile information to get a better service',
      icon: Icons.priority_high_outlined,
      color: '#35C2DD');
}

Widget premiumecard(
  context, {
  required String text,
}) {
  return Container(
    height: 55,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: HexColor('#FFFFFF'),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(7.0, 6.0),
          )
        ]),
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      onPressed: () {
        navigateto(context, UpgradeScreen());
      },
      child: Row(
        children: [
          Image(
            image: AssetImage('assets/images/upgrade2.png'),
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: HexColor('#022247')),
          )
        ],
      ),
    ),
  );
}

Widget popularsearch({required String text}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    height: 30,
    decoration: BoxDecoration(
        color: HexColor('#022247'), borderRadius: BorderRadius.circular(20)),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: HexColor('#F8F8F8')),
    ),
  );
}

Widget upgradebox(
    {required String imageroute,
    required String title,
    required String text,
    required Color color}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: color,
        backgroundImage: AssetImage(imageroute),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#022247')),
            ),
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: HexColor('#022247')),
            ),
          ],
        ),
      )
    ],
  );
}

Widget planebox(context,
    {required String imageroute,
    required String text,
    required String price,
    required String period,
    required VoidCallback onpressed,
    required BorderSide borderSide}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.3,
    child: MaterialButton(
      height: MediaQuery.of(context).size.height / 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: borderSide,
      ),
      onPressed: onpressed,
      child: Column(
        children: [
          Image(
            image: AssetImage(imageroute),
            height: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: HexColor('#022247')),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#48BC98')),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Egp/$period',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#48BC98')),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget TrialRegister(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: MediaQuery.of(context).size.width / 2.2,
        child: MaterialButton(
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: HexColor('#48BC98'),
          onPressed: () {
            navigateto(context, LoginScreen());
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 2.3,
        child: MaterialButton(
          textColor: HexColor('#35C2DD'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: HexColor('#35C2DD'))),
          color: HexColor('#F8F8F8'),
          onPressed: () {
            navigateto(context, SignUp0());
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}

Widget Trialservices(context) {
  return Column(
    children: [
      Row(
        children: [
          serviceitem(context,
              text: 'Search For Drugs',
              imageroute: 'assets/images/drugs.png',
              hexcolor: '#48BC98',
              seccolor: HexColor('#46C69F'), onpressed: () {
            navigateto(context, TrialSearch());
          }),
          Spacer(),
          serviceitem(context,
              text: 'Prescription Scanner',
              imageroute: 'assets/images/scan.png',
              hexcolor: '#35C2DD',
              seccolor: HexColor('#73CEE0'),
              onpressed: () {}),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 70,
      ),
      Row(
        children: [
          serviceitem(context,
              text: 'Reserve Your Drugs',
              imageroute: 'assets/images/reserve.png',
              hexcolor: '#35C2DD',
              seccolor: HexColor('#73CEE0'),
              onpressed: () {}),
          Spacer(),
          serviceitem(context,
              text: 'Nearest Phamacy',
              imageroute: 'assets/images/nearestpharmacy.png',
              hexcolor: '#48BC98',
              seccolor: HexColor('#46C69F'),
              onpressed: () {}),
        ],
      ),
    ],
  );
}

Widget ratebutton(context,
    {required String text,
    required String hexcolor,
    required VoidCallback onpressed}) {
  return Container(
    width: MediaQuery.of(context).size.width / 3,
    child: MaterialButton(
      padding: EdgeInsets.zero,
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      color: HexColor('$hexcolor'),
      textColor: Colors.white,
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget addbutton(
    {required IconData icon,
    required Color color,
    required VoidCallback onpressed}) {
  return Container(
    width: 30,
    child: MaterialButton(
      padding: EdgeInsets.zero,
      height: 25,
      onPressed: onpressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}

class FormFieldItem extends StatelessWidget {
  TextInputType inputtype;
  String name;
  String validatemessage;
  TextEditingController controller;
  bool secure;
  Widget? suffix;
  FormFieldItem(
      {required this.controller,
      required this.inputtype,
      required this.name,
      required this.validatemessage,
      required this.secure,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputtype,
      obscureText: secure,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return validatemessage;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          suffixIcon: suffix,
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black, width: 2),
          )),
    );
  }
}

Widget scanButton(
    {required String text,
    required VoidCallback onPressed,
    required IconData icon}) {
  return Container(
    width: 75,
    child: MaterialButton(
      padding: EdgeInsets.zero,
      height: 60,
      color: HexColor('#022247'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      textColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          )
        ],
      ),
    ),
  );
}
