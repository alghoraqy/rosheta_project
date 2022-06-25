import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/LoginCubit/login_cubit.dart';
import 'package:rosheta_project/Bloc/LoginStates/login_states.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Bloc/Trialcubit/trial_cubit.dart';
import 'package:rosheta_project/Bloc/Trialcubit/trial_states.dart';
import 'package:rosheta_project/Bloc/map/map_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_cubit.dart';
import 'package:rosheta_project/Bloc/pharmacy/pharmacy_states.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Network/Local/cash_helper.dart';
import 'package:rosheta_project/Shared/variable.dart';
import 'package:rosheta_project/constant.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymain/pharmacy_editprofile.dart';
import 'package:rosheta_project/modules/Pharmacy/Pharmacymaster/pharmacymaster.dart';
import 'package:rosheta_project/modules/User/usermain/edit_profile.dart';
import 'package:rosheta_project/modules/User/usermaster/usermaster.dart';
import 'package:rosheta_project/modules/login/login.dart';
import 'package:rosheta_project/modules/signUp/sign_up3.dart';
import 'package:rosheta_project/modules/signUp/sign_uppharmacy.dart';
import 'package:rosheta_project/modules/splash/splash.dart';
import 'package:rosheta_project/repository/map_repo.dart';
import 'Shared/Network/remote/places_webservices.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await Firebase.initializeApp();

  uId = CashHelper.getData(key: 'uId');
  isuser = CashHelper.getData(key: 'isuser');

  Widget widget;
  if (uId != null) {
    if (isuser!) {
      widget = const UserMaster();
    } else {
      widget = const PharmacyMaster();
    }
  } else {
    widget = const SplashScreen();
  }

  runApp(Phoenix(
    child: MyApp(
      startwidget: widget,
    ),
  ));
}

class MyApp extends StatelessWidget {
  Widget startwidget;
  MyApp({Key? key, required this.startwidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit();
        }),
        BlocProvider(create: (context) {
          return MapsCubit(MapsRepository(PlacesWebservices()));
        }),
        BlocProvider(create: (context) {
          return RegisterCubit();
        }),
        BlocProvider(create: (context) {
          return UserCubit()
            ..getuserData()
            ..getArticles()
            ..getallPharmacyId();
        }),
        BlocProvider(create: (context) {
          return PharmacyCubit()
            ..getpharmacydata()
            ..getMydrugs()..getPharmaciesUsers();
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
        home: startwidget,
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
