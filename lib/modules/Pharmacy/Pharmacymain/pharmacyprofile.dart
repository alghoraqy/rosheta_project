import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacy_editprofile.dart';

class PharmacyProfile extends StatelessWidget {
  const PharmacyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PharmacyCubit cubit = PharmacyCubit.get(context);
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 6))
                    ]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                  backgroundImage:
                      NetworkImage('${cubit.pharmacyModel!.image}'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: HexColor('F8F8F8'),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      profileItem(context, text: cubit.pharmacyModel!.name!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: profileItem(context,
                            text: cubit.pharmacyModel!.email!),
                      ),
                      profileItem(context, text: cubit.pharmacyModel!.phone!),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: profileItem(context,
                            text: cubit.pharmacyModel!.address!),
                      ),
                      Row(
                        children: [
                          profileItem(context,
                              text: '${cubit.pharmacyModel!.open!}',
                              width:
                                  MediaQuery.of(context).size.width / 2 - 30),
                          Spacer(),
                          profileItem(context,
                              text: '${cubit.pharmacyModel!.close!}',
                              width:
                                  MediaQuery.of(context).size.width / 2 - 30),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              'Delivery',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            cubit.radio[0]['is_selected'] == true
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: userbutton(context,
                              text: 'Edit Profile',
                              imageroute: 'assets/images/edit.png',
                              onpressed: () {
                            navigateto(context, PharmacyEditProfile());
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
