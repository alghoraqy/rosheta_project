import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, states) {},
      builder: (context, states) {
        PharmacyCubit cubit = PharmacyCubit.get(context);
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
                            image: AssetImage('assets/images/wallet.png'),
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                      Text(
                        'My Wallet',
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
                          'All details :',
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
                            imageroute: 'assets/images/counter.png',
                            title: 'Num of orders:',
                            text: '877 order this month.',
                            color: Colors.white.withOpacity(.5)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        upgradebox(
                            imageroute: 'assets/images/money.png',
                            title: 'Profit',
                            text: r'15,480$ this month.',
                            color: Colors.white),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 70,
                        ),
                        upgradebox(
                            imageroute: 'assets/images/money (1).png',
                            title: 'Application dues',
                            text: r'5,620$ this month',
                            color: Colors.white.withOpacity(.8)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                'Dues must be paid on 1/7/2022 to 4/7/2022 at the latest.',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 11,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#022247')),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                        ),
                        LoginButton(context,
                            widget: Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onpressed: () {}),
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
