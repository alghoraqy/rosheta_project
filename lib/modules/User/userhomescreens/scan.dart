import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, states) {},
      builder: (context, states) {
        UserCubit cubit = UserCubit.get(context);
        return Scaffold(
          appBar: backappbar(context, title: 'Scan'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15),
                          image: cubit.imagepicked != null
                              ? DecorationImage(
                                  image: FileImage(cubit.imagepicked!),
                                  fit: BoxFit.cover)
                              : null),
                      child: cubit.imagepicked == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    scanButton(
                                        text: 'Gallery',
                                        onPressed: () {
                                          cubit.getimage(
                                              source: ImageSource.gallery);
                                        },
                                        icon: Icons.image),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    scanButton(
                                        text: 'Camera',
                                        onPressed: () {
                                          cubit.getimage(
                                              source: ImageSource.camera);
                                        },
                                        icon: Icons.camera_alt_outlined),
                                  ],
                                ),
                              ],
                            )
                          : null),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Drugs :',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: HexColor('#022247'),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 45,
                            child: scanButton(
                                text: 'Try again',
                                onPressed: () {
                                  cubit.refreshscan();
                                },
                                icon: Icons.refresh_outlined),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (cubit.imagepicked == null && cubit.scannedText == '')
                        Text(
                          'No Drugs scanned yet',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#022247')),
                        ),
                      if (cubit.scannedText == '' && cubit.imagepicked != null)
                        Center(
                          child: CircularProgressIndicator(
                            color: HexColor('#022247'),
                          ),
                        ),
                      if (cubit.scannedText != '')
                        Text(
                          cubit.scannedText,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#022247')),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
