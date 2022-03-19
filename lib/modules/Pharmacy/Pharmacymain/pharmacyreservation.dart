import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class PharmacyReservations extends StatelessWidget {
  const PharmacyReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: HexColor('F8F8F8'),
              borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 15, left: 15, bottom: 30),
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
        );
      },
    );
  }
}
