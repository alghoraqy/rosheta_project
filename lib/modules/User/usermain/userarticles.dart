import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/usermain/articleview.dart';

class UserArticles extends StatelessWidget {
  const UserArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (contex,states){},
      builder: (context, states){
        RegisterCubit cubit =RegisterCubit.get(context);
        return layout(context, 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Searchbox(context, text: 'Search in articles ...', width: MediaQuery.of(context).size.width),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.15,
                children: [
                 cubit.pressure? articleitem(context, text: 'cuts and scropes', imageroute: 'assets/images/cuts.jpg', onpressed: () {navigateto(context, ArticleView(imageroute: 'https://assets.aboutkidshealth.ca/AKHAssets/cuts_scrapes_children_first_aid.jpg?renditionid=21', title: 'Cuts and Scropes',)); }):articleitem(context, text: 'Snake Bit', imageroute: 'assets/images/snake.png', onpressed: () {  }),
                 cubit.pressure?articleitem(context, text: 'cuts and scropes', imageroute: 'assets/images/cuts.jpg', onpressed: () {  }):articleitem(context, text: 'Snake Bit', imageroute: 'assets/images/snake.png', onpressed: () {  }),
                  articleitem(context, text: 'cuts and scropes', imageroute: 'assets/images/cuts.jpg', onpressed: () {  }),
                  articleitem(context, text: 'Snake Bit', imageroute: 'assets/images/snake.png', onpressed: () {  }),
                  articleitem(context, text: 'cuts and scropes', imageroute: 'assets/images/cuts.jpg', onpressed: () {  }),
                  articleitem(context, text: 'cuts and scropes', imageroute: 'assets/images/cuts.jpg', onpressed: () {  }),
                  articleitem(context, text: 'Snake Bit', imageroute: 'assets/images/snake.png', onpressed: () {  }),
                  articleitem(context, text: 'cuts and scropes', imageroute: 'assets/images/cuts.jpg', onpressed: () {  }),
                ],
              ),
            )
          ],
        ),
      )
      );
      },
    ) ;
  }
}
