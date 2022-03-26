import 'package:docmate/patient%20route/homePage/seeAll/latestNews.dart';
import 'package:docmate/patient%20route/homePage/seeAll/medicalAdvices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Blocs/register/register_cubit.dart';
import '../../Blocs/register/register_states.dart';
import '../../constant.dart';
import '../../shared/sharedComponent.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  static String homePageID = "IdOfHomePage";

  final int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 8, fontWeight: FontWeight.w100);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPatientCubit, RegisterStates>(
        listener: (contex, states) {},
        builder: (context, states) {
          RegisterPatientCubit cubit = RegisterPatientCubit.get(context);
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
            body:  Container(
             // physics: NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                       titleAndSeeAll(
                        context,
                          onpressed: () {
                          Navigator.pushNamed(context,LatestNews.latestNewsID);
                          },
                          titletext:"Latest News",sizedWidth:3

                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                      children:[
                        latestNewsSilder(
                            context,
                            onpressed: () { },
                            imageroute: 'images/covidImage.png',
                            text: "New vaccine revealed for covid-19",),
                        latestNewsSilder(
                          context,
                          onpressed: () { },
                          imageroute: 'images/CovidImage1.png',
                          text: "New vaccine revealed for covid-19",),
                        latestNewsSilder(
                          context,
                          onpressed: () { },
                          imageroute: 'images/covidImage.png',
                          text: "New vaccine revealed for covid-19",),
                        latestNewsSilder(
                          context,
                          onpressed: () { },
                          imageroute: 'images/covidImage.png',
                          text: "New vaccine revealed for covid-19",),

                       ]
                      ),
                    ),

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
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                        children: [
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/covidImage.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/CovidImage1.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/CovidImage1.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/covidImage.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/covidImage.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/CovidImage1.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/CovidImage1.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/covidImage.png',
                            text: "  covid-19",
                          ),
                          medicalAdvices(
                            context, onpressed: () {  },
                            imageroute: 'images/CovidImage1.png',
                            text: "  covid-19",
                          )
                        ],
                      ),
                    )

                  ]
              ),
            ),
            bottomNavigationBar:
                buildBottomNavigationBar(selectedIndex: _selectedIndex),
          );
        });
  }




}



