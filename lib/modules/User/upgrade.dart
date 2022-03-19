import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, states) {},
      builder: (context, states) {
        UserCubit cubit = UserCubit.get(context);

        return Scaffold(
          backgroundColor: HexColor('#022247'),
          appBar: backappbar(context, title: ''),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 14,
                            backgroundColor: HexColor('#465C76'),
                          ),
                          Image(
                            image: AssetImage('assets/images/premium.png'),
                            height: 145,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                      Text(
                        'Upgrade To Premium',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: HexColor('#FAFAFA')),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: HexColor('#F8F8F8'),
                      borderRadius: BorderRadius.circular(30)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Here\'s what you get :',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#022247')),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        upgradebox(
                            imageroute: 'assets/images/ads.jpg',
                            title: 'No Ads',
                            text:
                                'Enjoy Rosheta Scanner without any ad banner.',
                            color: Colors.red.withOpacity(.5)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        upgradebox(
                            imageroute: 'assets/images/crown.png',
                            title: 'Premium Badge',
                            text: 'Look professional in your profile.',
                            color: Colors.purple),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        upgradebox(
                            imageroute: 'assets/images/pharmacydt.png',
                            title: 'Pharmacy Details',
                            text:
                                'You can see all details of pharmacy such as phone number & email address',
                            color: Colors.blue.withOpacity(.8)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Text(
                          'Choose your plane :',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#022247')),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            planebox(context,
                                imageroute: 'assets/images/diamond.png',
                                text: 'Special Package',
                                price: '200',
                                period: 'month', onpressed: () {
                              cubit.changespecial();
                            },
                                borderSide: cubit.specialpackage
                                    ? BorderSide(color: Colors.black, width: 4)
                                    : BorderSide(
                                        color: Colors.black, width: 1)),
                            planebox(context,
                                imageroute: 'assets/images/diamond2.png',
                                text: 'Premium Package',
                                price: '900',
                                period: 'year', onpressed: () {
                              cubit.changepremium();
                            },
                                borderSide: cubit.specialpackage
                                    ? BorderSide(color: Colors.black, width: 1)
                                    : BorderSide(
                                        color: Colors.black, width: 4)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        LoginButton(context,
                            text: 'Upgrade Now', onpressed: () {})
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
