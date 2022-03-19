import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Shared/Components/pharmacycomponent.dart';

class PharmacyAdddrugs extends StatelessWidget {
  const PharmacyAdddrugs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmacyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor('#022247'),
          appBar: AppBar(
            title: Text(
              'Add new drugs',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: HexColor('F8F8F8'),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Container(
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
                          backgroundColor: Colors.white,
                          radius: 70,
                          child: Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/128/822/822092.png'),
                          ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  buildTextFormField(context,
                      text: 'Drug name',
                      style: Theme.of(context).textTheme.overline),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: buildTextFormField(context,
                        text: 'Price',
                        style: Theme.of(context).textTheme.overline),
                  ),
                  buildTextFormField(context,
                      text: 'Company name',
                      style: Theme.of(context).textTheme.overline),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(0, 6.0),
                              ),
                            ]),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              maxLines: 6,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Description...',
                                hintMaxLines: 10,
                                hintStyle: Theme.of(context).textTheme.overline,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildBottom(
                    context,
                    onPressed: () {},
                    text: 'Add drug',
                    icon: Icons.add_circle_outline,
                    width: 150,
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
