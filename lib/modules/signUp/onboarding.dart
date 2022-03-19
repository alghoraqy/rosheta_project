// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:rosheta_project/Bloc/register/registercubit.dart';
// import 'package:rosheta_project/Bloc/register/registerstates.dart';
// import 'package:rosheta_project/Shared/Components/components.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnBoardingSCreen extends StatelessWidget {
//   const OnBoardingSCreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) {
//         return RegisterCubit();
//       },
//       child: BlocConsumer<RegisterCubit, RegisterStates>(
//         listener: (context, states) {},
//         builder: (context, states) {
//           RegisterCubit cubit = RegisterCubit.get(context);
//           return Scaffold(
//             backgroundColor: HexColor('#022247'),
//             appBar: AppBar(
//               leadingWidth: 0,
//               leading: SizedBox(
//                 width: 20,
//               ),
//               title: actionbutton(
//                   icon: Icons.arrow_back_outlined,
//                   onpressed: () {
//                     Navigator.pop(context);
//                   }),
//             ),
//             body: Form(
//               key: cubit.formkey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('assets/images/secondlogo.png'),
//                         width: MediaQuery.of(context).size.width),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           LoginText(text: 'Sign Up'),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 50,
//                           ),
//                           Container(
//                             height: MediaQuery.of(context).size.height /2.8,
//                             child: PageView(
//                             // physics: NeverScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               controller: cubit.onboardingcontroller,
//                               children: [
//                                 signup1(context),
//                                 signup1(context),
//                                 signup1(context),
//                                 signup1(context),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 40,
//                           ),
//                           LoginButton(context, text: 'Submit', onpressed: () {
//                            cubit.formkey.currentState!.validate()? cubit.onboardingcontroller.nextPage(duration: Duration(seconds: 1) , curve: Curves.easeIn):null;
//                           }),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                             height: MediaQuery.of(context).size.height / 30,
//                           ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SmoothPageIndicator(
//                                 controller: cubit.onboardingcontroller,
//                                 count:4,
//                                 axisDirection: Axis.horizontal,
//                                 effect: ScrollingDotsEffect(
//                                   dotHeight: 14,
//                                   dotWidth: 14,
//                                   activeDotScale: 1,
                                  
//                                   activeDotColor: HexColor('#48BC98'),
//                                   dotColor: HexColor('#AEB8C3')
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
