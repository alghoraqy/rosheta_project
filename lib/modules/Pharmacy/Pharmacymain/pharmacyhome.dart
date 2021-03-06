import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/map/map_screen.dart';

class PharmacyHome extends StatelessWidget {
  const PharmacyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PharmacyCubit cubit = PharmacyCubit.get(context);
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: HexColor('F8F8F8'),
              borderRadius: BorderRadius.circular(20)),
          child: cubit.myDrugs.isEmpty && cubit.pharmacyModel == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : cubit.drugsid.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 23,
                                  backgroundImage: NetworkImage(
                                    '${cubit.pharmacyModel!.image}',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi, ${cubit.pharmacyModel!.name} Pharmacy',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      'Welcome Back',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Searchbox(
                                    context,
                                    text: 'Search in drugs...',
                                    width: 0,
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 16,
                                    child: MaterialButton(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: HexColor('#022247'),
                                      onPressed: () {
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          state is GetMyDrugsLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : DataTable(
                                  border: TableBorder.all(
                                      color: Colors.grey.withOpacity(.1),
                                      style: BorderStyle.solid,
                                      width: 1,
                                      borderRadius: BorderRadius.circular(20)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  columnSpacing: 25,
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      'Img',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Name',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Price',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Quantity',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Other',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                  ],
                                  rows: cubit.myDrugs.map((data) {
                                    return DataRow(cells: [
                                      DataCell(Image(
                                        image: NetworkImage(data.image!),
                                        width: 40,
                                        height: 30,
                                      )),
                                      DataCell(Text(
                                        data.name!,
                                        style: TextStyle(fontSize: 10),
                                      )),
                                      DataCell(Text(
                                        '${data.price!}',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                      DataCell(Text(
                                        '${data.quantity!}',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                      DataCell(Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cubit.updatedrugpricecontroller
                                                  .text = '${data.price}';
                                              cubit.updateindex = data.quantity;
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  context: context,
                                                  builder: (context) {
                                                    return BlocConsumer<
                                                        PharmacyCubit,
                                                        PharmacyStates>(
                                                      listener:
                                                          ((context, state) {}),
                                                      builder:
                                                          (context, state) {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(15),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                    'Update a drug',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: HexColor(
                                                                            '#022247')),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  myDivider(
                                                                      context),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        50,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 30),
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'price :',
                                                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: HexColor('#022247')),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 25,
                                                                              width: MediaQuery.of(context).size.width / 1.7,
                                                                              child: TextFormField(
                                                                                controller: cubit.updatedrugpricecontroller,
                                                                                keyboardType: TextInputType.number,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 30),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              'Quantity : ',
                                                                              style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w700,
                                                                                color: HexColor('#022247'),
                                                                              ),
                                                                            ),
                                                                            addbutton(
                                                                                icon: Icons.add,
                                                                                color: HexColor('#022247'),
                                                                                onpressed: () {
                                                                                  cubit.increaseupdate();
                                                                                }),
                                                                            SizedBox(
                                                                              width: 7,
                                                                            ),
                                                                            Text(
                                                                              '${cubit.updateindex}',
                                                                              style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: HexColor('#022247'),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 7,
                                                                            ),
                                                                            addbutton(
                                                                                icon: Icons.remove,
                                                                                color: HexColor('#AEB8C3'),
                                                                                onpressed: () {
                                                                                  cubit.decreaseupdate();
                                                                                }),
                                                                            SizedBox(
                                                                              height: 30,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Center(
                                                                        child: userbutton(
                                                                            context,
                                                                            text:
                                                                                'Save Changes',
                                                                            imageroute:
                                                                                'assets/images/save.png',
                                                                            onpressed:
                                                                                () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          cubit.updatedrugs(
                                                                              uid: cubit.drugsid[data.uid!],
                                                                              quantity: cubit.updateindex,
                                                                              price: cubit.updatedrugpricecontroller.text);
                                                                        }),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  });
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                'assets/images/edit.png',
                                              ),
                                              color: Colors.green,
                                              height: 25,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              cubit.deletedrug(
                                                  uid:
                                                      cubit.drugsid[data.uid!]);
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                'assets/images/delete.png',
                                              ),
                                              color: Colors.red,
                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ]);
                                  }).toList(),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 35,
                                  height: 35,
                                  child: const Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: 15,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: HexColor('#022247')))),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                  width: 35,
                                  height: 35,
                                  child: const Center(
                                      child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                      color: HexColor('#022247'),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: HexColor('#022247')))),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                  width: 35,
                                  height: 35,
                                  child: const Center(
                                      child: Text(
                                    '2 ',
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: HexColor('#022247')))),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                  width: 35,
                                  height: 35,
                                  child: const Center(
                                      child: Text(
                                    '3',
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: HexColor('#022247')))),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                  width: 35,
                                  height: 35,
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: HexColor('#022247')))),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
        );
      },
    );
  }
}
