import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/LoginCubit/login_cubit.dart';
import 'package:rosheta_project/Bloc/Trialcubit/trial_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymaster/pharmacymaster.dart';
import 'package:rosheta_project/modules/splash/splash.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit();
        }),
        BlocProvider(create: (context) {
          return RegisterCubit();
        }),
        BlocProvider(create: (context) {
          return UserCubit();
        }),
        BlocProvider(create: (context) {
          return PharmacyCubit();
        }),
        BlocProvider(create: (context) {
          return TrialCubit();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins',
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('#022247'),
              ),
              elevation: 0,
              titleSpacing: 22,
              backgroundColor: HexColor('#022247'),
              actionsIconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('#022247'),
                selectedIconTheme:
                    IconThemeData(size: 30, color: Colors.green.shade200),
                showUnselectedLabels: true,
                unselectedItemColor: Colors.white,
                elevation: 0,
                unselectedIconTheme: const IconThemeData(color: Colors.white),
                selectedItemColor: HexColor('#35C2DD'),
                type: BottomNavigationBarType.fixed),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 15,
                color: HexColor('1C2E44'),
              ),
              bodyText2: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: HexColor('#022247'),
              ),
              overline: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.withOpacity(0.5),
              ),
              headline1: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              caption: TextStyle(
                fontSize: 9,
                color: HexColor('#022247'),
              ),
            )),
        home: SplashScreen(),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
