import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/Bloc/States/states.dart';
import 'package:rosheta_project/Shared/Components/components.dart';
import 'package:rosheta_project/modules/User/userhomescreens/search.dart';
import 'package:rosheta_project/modules/User/usermain/articleview.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, states) {},
      builder: (context, states) {
        UserCubit cubit = UserCubit.get(context);

        return layout(
            context,
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: cubit.articles.isNotEmpty && cubit.userModel != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.5),
                                          spreadRadius: 0,
                                          blurRadius: 8,
                                          offset: Offset(6.0, 6.0))
                                    ]),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 40,
                                    backgroundImage:
                                        NetworkImage(cubit.userModel!.image!)),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi, ${cubit.userModel!.name}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor('#022247')),
                                  ),
                                  maintitle(text: 'Welcome Back')
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Searchbox(
                                  context,
                                  text: 'Search ...',
                                  width: 0,
                                  onPressed: () {
                                    navigateto(context, SearchForDrugs());
                                  },
                                  controller: null,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 16,
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    color: HexColor('#022247'),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          maintitle(text: 'Our Services'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 90,
                          ),
                          services(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 35,
                          ),
                          maintitle(text: 'First aid articles'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 90,
                          ),
                          Row(
                            children: [
                              articleitem(context,
                                  imageroute: cubit.articles[3].image!,
                                  text: cubit.articles[3].title!,
                                  onpressed: () {
                                navigateto(
                                    context,
                                    ArticleView(
                                      imageroute: cubit.articles[3].image!,
                                      title: cubit.articles[3].title!,
                                      body: cubit.articles[3].body!,
                                    ));
                              }),
                              Spacer(),
                              articleitem(context,
                                  imageroute: cubit.articles[2].image!,
                                  text: cubit.articles[2].title!,
                                  onpressed: () {
                                navigateto(
                                    context,
                                    ArticleView(
                                      imageroute: cubit.articles[2].image!,
                                      title: cubit.articles[2].title!,
                                      body: cubit.articles[2].body!,
                                    ));
                              })
                            ],
                          ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
      },
    );
  }
}
