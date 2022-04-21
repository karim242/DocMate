import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';
import '../../patient route/homePage/profilePage.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);
  static String docProfileID = "IDDoctorProfile";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data = cubit.latestNew;
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Color(0xFF01B9C8)
          ));
          return SafeArea(
            child: Scaffold(
              body: ListView(
                  children:[ Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context).size.height / 4,
                        decoration: const BoxDecoration(
                            color: Color(0xFF01B9C8),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(40))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //remove const when using api
                          children: const [
                            CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/140x100')
                            ),
                            Text('profile name', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text('email', style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            MyInfoWidget(title: 'Specialization', info: 'info'),
                            SizedBox(height: 10,),
                            MyInfoWidget(title: 'Phone Number', info: 'info',),
                            SizedBox(height: 10,),
                            MyInfoWidget(title: 'Location', info: 'info',),
                            SizedBox(height: 10,),
                            MyInfoWidget(title: 'ID', info: 'info',),
                            SizedBox(height: 10,),

                          ],
                        ),
                      )


                    ],
                  ),
                  ]
              ),
            ),
          );
        });
  }

}