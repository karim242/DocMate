// ignore_for_file: dead_code

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/doctor%20route/doctorHomePage/searchBox/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../network_helper/cachehelper/cacheHelper.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';
import '../../patient route/homePage/drawe_items/changepassword.dart';
import '../../patient route/homePage/drawe_items/editprofile.dart';
import '../../patient route/homePage/seeAll/latestNews.dart';
import '../../patient route/homePage/seeAll/medicalAdvices.dart';
import '../../selectUser/splashScreen.dart';
import '../../shared/sharedComponent.dart';
import 'doctor_drawe_items/docChangePassword.dart';
import 'doctor_drawe_items/editdoctorprofile.dart';

class DoctorHomePageScreen extends StatelessWidget {
  DoctorHomePageScreen({Key? key}) : super(key: key);
  static String IdDoctorHome = "IdOfDoctorHomePage";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data = cubit.latestNew;

          return SafeArea(
              child :Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title:Container(
                height: 44,
                width: 230,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller :cubit.searchController,
                  decoration: InputDecoration(
                    prefixIcon:IconButton(
                      icon:  const Icon(Icons.search),
                    onPressed :(){
                      cubit.postSearchAPI();
                      navigateTo(context, const SearchPage());
                    },),
                    suffixIcon: IconButton(
                      icon:  const Icon(Icons.clear),
                      onPressed: () {
                     cubit.searchController.clear();

                      },
                    ),
                    hintText: "Search",
                    border: InputBorder.none
                  ),

                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu_sharp,
                    ),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: const EdgeInsets.only(top: 60),
                children: [
                  ExpansionTile(
                    leading: const Icon(Icons.settings),
                    title: const Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {

                              navigateTo(context, const EditDoctorProfile());
                            },
                            child: const Text(
                              'Edit Profile',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {

                            navigateTo(context, const ChangeDoctorsPassword());

                            },
                            child: const Text(
                              'Change password',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Language option',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TitleInDrawer(
                    icons: Icons.phone,
                    text: "Contact",
                    ontap: () {},
                  ),
                  TitleInDrawer(
                    icons: Icons.local_library,
                    text: "About Us",
                    ontap: () {},
                  ),
                  TitleInDrawer(
                    icons: Icons.mobile_screen_share_sharp,
                    text: "Share Our App",
                    ontap: () {},
                  ),
                  TitleInDrawer(
                    icons: Icons.reply_sharp,
                    text: "Log Out",
                    ontap: () {
                      CacheHelper.removeData(key: "token",
                    ).then((value) {
                      if(value)
                      {
                        navigateAndFinish(context,const SplashScreen(),);
                      }
                    });
                      },
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
                condition: states is! NetworkLoadingStates,
                builder: (BuildContext context) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        titleAndSeeAll(
                          context,
                          onpressed: () {
                            Navigator.pushNamed(
                                context, LatestNews.latestNewsID);
                          },
                          titletext: "Latest News",
                          sizedWidth: 3,
                        ),
                        carouselSlider(
                          context,
                          data,
                        ),
                        titleAndSeeAll(context, titletext: "Medical Advices",
                            onpressed: () {
                          Navigator.pushNamed(
                              context, MedicalAdvices.medicalAdvicesId);
                        }, sizedWidth: 4),
                        Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                medicalAdvices(context,
                                    articles: data, index: index +5),
                            itemCount: 9,
                          ),
                        )
                      ],
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
          );
        });
  }
}
