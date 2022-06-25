import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/map/map_screen.dart';

import '../../../Models/pharmacymodel.dart';

class AllPharmacies extends StatelessWidget {
  const AllPharmacies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pharmacies Location'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildAllPharmaciesUsers(
                          PharmacyCubit.get(context).pharmacyUser[index],
                          context,
                          index);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(.2),
                        ),
                      );
                    },
                    itemCount: PharmacyCubit.get(context).pharmacyUser.length),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildAllPharmaciesUsers(PharmacyModel model, context, index) {
    return InkWell(
      child: ListTile(
        onTap: () {
          navigateto(
              context,
              GoogleMapScreen(
                destLongitude:
                    PharmacyCubit.get(context).pharmacyUser[index].longitude,
                destLatitude:
                    PharmacyCubit.get(context).pharmacyUser[index].latitude,
              ));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(model.image!),
          radius: 30,
        ),
        title: Text(model.name!),
      ),
    );
  }
}
