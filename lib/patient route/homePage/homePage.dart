

import 'package:docmate/patient%20route/homePage/seeAll/latestNews.dart';
import 'package:docmate/patient%20route/homePage/seeAll/medicalAdvices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';
import '../../shared/sharedComponent.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  static String homePageID = "IdOfHomePage";



  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (BuildContext context)=>NetworkCubit()..getLatestNews(),
      child :BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          // dynamic list= NetworkCubit.get(context).latestNew;
          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data= cubit.latestNew;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Welcome, Karim",
                style: textTitleStyle,
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_sharp,
                  ),
                  color: Colors.black,
                  iconSize: 30,
                )
              ],
            ),
            body: ConditionalBuilder(
              condition:states is ! NetworkLoadingStates,
              builder: (BuildContext context) {
               return Container(

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        titleAndSeeAll(
                          context,
                          onpressed: () {
                            Navigator.pushNamed(context,LatestNews.latestNewsID);
                            print(data[0]['title']);
                          },
                          titletext:"Latest News",sizedWidth:3,


                          // latestNewsSilder(context,list)

                        ),

                        carouselSlider(context, data),


                        titleAndSeeAll(
                            context,
                            titletext: "Medical Advices",
                            onpressed: (){
                              Navigator.pushNamed(context,
                                  MedicalAdvices.medicalAdvicesId);
                            }, sizedWidth: 4
                        ),
                        Expanded(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            children: [
                              medicalAdvices(
                                context,
                                articles:data[11],
                                onpressed: () {  },
                              ),
                              medicalAdvices(
                                context,
                                articles:data[12],
                                onpressed: () {  },

                              ),
                              medicalAdvices(
                                context,
                                articles:data[12],
                                onpressed: () {  },

                              ),
                              medicalAdvices(
                                context,
                                articles:data[14],
                                onpressed: () {  },
                              ),
                              medicalAdvices(
                                context,
                                articles:data[15],
                                onpressed: () {  },

                              ),
                              medicalAdvices(
                                context,
                                articles:data[16],
                                onpressed: () {  },

                              ),
                            ],
                          ),
                        )

                      ]
                  ),
                );
              },
              fallback: (BuildContext context) {
                return const Center(child: CircularProgressIndicator(),) ;
                },
            ),
            bottomNavigationBar:
                buildBottomNavigationBar(selectedIndex: cubit.selectedIndex),
          );
        }
      ),
    );
  }
}
