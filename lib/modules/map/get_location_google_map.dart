import 'package:flutter/material.dart';
import 'package:google_maps_pick_place/models/address_model.dart';
import 'package:google_maps_pick_place/view/main_map/map.dart';
import 'package:rosheta_project/constant.dart';

import '../../Bloc/register/registercubit.dart';
import '../../Shared/variable.dart';

class GetMyLocation extends StatefulWidget {
  const GetMyLocation({Key? key}) : super(key: key);

  @override
  State<GetMyLocation> createState() => _GetMyLocationState();
}

class _GetMyLocationState extends State<GetMyLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GoogleMapsPickPlace(
        apiKey: googleMapKey,
        getResult: (FullAddress fullAddress) {
          setState(() {
            address = fullAddress.address.toString().replaceAll('،', '-');
            latitude = fullAddress.position!.latitude;
            longitude = fullAddress.position!.longitude;
            editaddresscontroller.text = address!;
            editAddressPharmacyController.text = address!;
            RegisterCubit.get(context).useraddresscontroller.text=address!;
            RegisterCubit.get(context).pharmacyaddresscontroller.text=address!;

          });
        },
      ),
    );
  }
}
