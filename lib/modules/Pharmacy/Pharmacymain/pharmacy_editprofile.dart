
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';
import 'package:rosheta_project/Shared/variable.dart';
import 'package:rosheta_project/modules/map/map_screen.dart';

class PharmacyEditProfile extends StatelessWidget {
  const PharmacyEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TextEditingController editnamecontroller = TextEditingController();
        TextEditingController editemailcontroller = TextEditingController();
        TextEditingController editphonecontroller = TextEditingController();
        TextEditingController editopencontroller = TextEditingController();
        TextEditingController editclosecontroller = TextEditingController();
        TextEditingController editaddresscontroller = TextEditingController();
        TextEditingController editpasswordcontroller = TextEditingController();
        TextEditingController confirmeditpasswordcontroller =
            TextEditingController();

        editnamecontroller.text =
            PharmacyCubit.get(context).pharmacyModel!.name!;
        editemailcontroller.text =
            PharmacyCubit.get(context).pharmacyModel!.email!;
        editphonecontroller.text =
            PharmacyCubit.get(context).pharmacyModel!.phone!;
        editaddresscontroller.text =
            PharmacyCubit.get(context).pharmacyModel!.address!;
        editopencontroller.text =
            PharmacyCubit.get(context).pharmacyModel!.open!;
        editclosecontroller.text =
            PharmacyCubit.get(context).pharmacyModel!.close!;
        PharmacyCubit cubit = PharmacyCubit.get(context);
        return Scaffold(
            backgroundColor: HexColor('#022247'),
            appBar: backappbar(context, title: 'Edit Profile'),
            body: Column(
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
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          backgroundImage:
                              NetworkImage('${cubit.pharmacyModel!.image}'),
                        ),
                        // SizedBox(
                        //   width: 40,
                        //   height: 40,
                        //   child: FloatingActionButton(
                        //     heroTag: null,
                        //     onPressed: () {},
                        //     child: const Icon(
                        //       Icons.camera_alt,
                        //       color: Colors.white,
                        //     ),
                        //     backgroundColor: HexColor('48BC98'),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: HexColor('F8F8F8'),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          editprofileform(context,
                              controller: editnamecontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              controller: editemailcontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              controller: editphonecontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  child: editprofileform(context,
                                      controller: editaddresscontroller),
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                  flex: 1,
                                  child:
                                      locatonmap(context, hexcolor: '#35C2DD',onPressed: (){
                                        navigateto(context, const MapScreen());
                                      }))
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              text: 'New Password',
                              secure: true,
                              controller: editpasswordcontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          editprofileform(context,
                              text: 'New Password',
                              secure: true,
                              controller: confirmeditpasswordcontroller),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Row(
                            children: [
                              buildTextFormField(
                                context,
                                padding: 2,
                                controller: editopencontroller,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 30,
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                      color: HexColor('#022247'),
                                    ),
                              ),
                              const Spacer(),
                              buildTextFormField(
                                context,
                                padding: 2,
                                controller: editclosecontroller,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 30,
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                      color: HexColor('022247'),
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Do you have home delivery ?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: cubit.radio.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          cubit.radioBottomCheck(index);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  cubit.radio[index]
                                                          ['is_selected']
                                                      ? HexColor('022247')
                                                      : Colors.grey,
                                              radius: 10,
                                              child: Center(
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      cubit.radio[index]
                                                              ['is_selected']
                                                          ? Colors.green
                                                          : Colors.blueGrey,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              cubit.radio[index]['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: cubit.radio[index]
                                                            ['is_selected']
                                                        ? HexColor('022247')
                                                        : Colors.grey,
                                                  ),
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: userbutton(context,
                                  text: 'Save Changes',
                                  imageroute: 'assets/images/save.png',
                                  onpressed: () {
                                cubit.updatephamacy(
                                    name: editnamecontroller.text,
                                    email: editemailcontroller.text,
                                    phone: editphonecontroller.text,
                                    address: editaddresscontroller.text,
                                    open: editopencontroller.text,
                                    close: editclosecontroller.text,
                                longitude: position!.longitude,
                                latitude: position!.latitude);
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
