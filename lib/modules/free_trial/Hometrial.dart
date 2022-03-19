import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosheta_project/Bloc/Trialcubit/trial_cubit.dart';
import 'package:rosheta_project/Bloc/Trialcubit/trial_states.dart';
import 'package:rosheta_project/modules/User/usermain/userarticles.dart';
import 'package:rosheta_project/modules/User/usermain/userhome.dart';

import '../../Shared/Components/components.dart';

class TrialMaster extends StatelessWidget {
  const TrialMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrialCubit, TrialStates>(
      listener: (context, states) {},
      builder: (context, states) {
        TrialCubit cubit = TrialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Image(
              image: AssetImage(
                'assets/images/secondlogo.png',
              ),
              width: MediaQuery.of(context).size.width / 3.8,
            ),
          ),
          body: cubit.screens[cubit.current],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navList,
            currentIndex: cubit.current,
            onTap: (index) {
              cubit.changenav(index);
            },
          ),
        );
      },
    );
  }
}
