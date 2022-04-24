import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';

class PharmacyEditProfile extends StatelessWidget {
  const PharmacyEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                        const CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://s3-eu-west-1.amazonaws.com/forasna/uploads/logos/clogo_2018-08-02-13-32-50_b7tjXmVP4Tt4ZIiZnqD8wgXX.jpg'),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {},
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            backgroundColor: HexColor('48BC98'),
                          ),
                        ),
                      ],
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
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          buildTextFormField(
                            context,
                            text: 'Olivia Michel',
                            style:
                                Theme.of(context).textTheme.overline!.copyWith(
                                      color: HexColor('022247'),
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: buildTextFormField(
                              context,
                              text: 'olivia_michel@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(
                                    color: HexColor('022247'),
                                  ),
                            ),
                          ),
                          buildTextFormField(
                            context,
                            text: '+201234567891',
                            style:
                                Theme.of(context).textTheme.overline!.copyWith(
                                      color: HexColor('022247'),
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: profileitem(context,
                                          text: 'name of street, details ')),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: locatonmap(context,
                                        hexcolor: '#35C2DD'))
                              ],
                            ),
                          ),
                          buildTextFormField(context,
                              text: 'New Password',
                              style: Theme.of(context).textTheme.overline),
                          const SizedBox(
                            height: 15,
                          ),
                          buildTextFormField(context,
                              text: 'Confirm Password',
                              style: Theme.of(context).textTheme.overline),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                buildTextFormField(
                                  context,
                                  text: '07:00 AM',
                                  width: MediaQuery.of(context).size.width / 2 -
                                      40,
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
                                  text: '11:30 PM',
                                  width: MediaQuery.of(context).size.width / 2 -
                                      40,
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        color: HexColor('022247'),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                                  onpressed: () {}),
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
