import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/register/register_cubit.dart';
import '../../../Blocs/register/register_states.dart';
import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key? key}) : super(key: key);
  static String latestNewsID = "latestNewsID";


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPatientCubit, RegisterStates>(
        listener: (context, states) {},
        builder: (context, states) {
          RegisterPatientCubit cubit = RegisterPatientCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                " Latest News",
                style: textTitleStyle,

              ),
              leading:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
                icon: const Icon(
                  Icons.arrow_back,
                 ),
               color: Colors.black,
              iconSize: 30,

            ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,top: 10.0),
                child: Column(
                  children: [
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
                    latestNewsSilder(
                      context,
                      onpressed: () { },
                      imageroute: 'images/CovidImage1.png',
                      text: "New vaccine revealed for covid-19",),
                    latestNewsSilder(
                      context,
                      onpressed: () { },
                      imageroute: 'images/CovidImage1.png',
                      text: "New vaccine revealed for covid-19",),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
