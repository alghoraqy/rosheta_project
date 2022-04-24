import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Bloc/register/registercubit.dart';
import 'package:rosheta_project/Bloc/register/registerstates.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/usermain/articleview.dart';

class UserArticles extends StatelessWidget {
  const UserArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (contex, states) {},
      builder: (context, states) {
        UserCubit cubit = UserCubit.get(context);
        return layout(
            context,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Searchbox(context,
                      text: 'Search in articles ...',
                      width: MediaQuery.of(context).size.width),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: cubit.articles.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.15,
                        ),
                        itemBuilder: (context, index) {
                          return articleitem(context,
                              text: cubit.articles[index].title!,
                              imageroute: cubit.articles[index].image!,
                              onpressed: () {
                            navigateto(
                                context,
                                ArticleView(
                                  imageroute: cubit.articles[index].image!,
                                  title: cubit.articles[index].title!,
                                  body: cubit.articles[index].body!,
                                ));
                          });
                        }),
                  )
                ],
              ),
            ));
      },
    );
  }
}
