
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';
import '../../patient route/homePage/profilePage.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);
  //static String docProfileID = "IDDoctorProfile";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          NetworkCubit cubit = NetworkCubit.get(context);
          Map<String,dynamic>doctorProfileData=cubit.doctorInfoData;
          SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
              statusBarColor: blueColor
          ));
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: blueColor,
                elevation: 0,
              ),
              body: ListView(
                  children:[ Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context).size.height / 5,
                        decoration: const BoxDecoration(
                            color: Color(0xFF01B9C8),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(40))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children:  [
                            cubit.doctorProfileImage == null
                                ? const CircleAvatar(
                                  radius: 40,
                                   backgroundImage: NetworkImage(
                                    'https://encrypted-tbn2.gstatic.com/'
                                        'images?q=tbn:ANd9GcSQntRPY-paKdW16dfSuNGw-aXz6t3fWCm3KlEMwM5YO7BbXge_'))
                               : CircleAvatar(
                                  radius: 40,
                                 backgroundImage:
                                  FileImage(cubit.doctorProfileImage!),
                            ),





                            Text(doctorProfileData.values.elementAt(1), style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(doctorProfileData.values.elementAt(2), style: const TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            MyInfoWidget(title: 'ID', info:doctorProfileData.values.elementAt(3),),
                            const SizedBox(height: 10,),
                            MyInfoWidget(title: 'Specialization', info: doctorProfileData.values.elementAt(5)),
                            const SizedBox(height: 10,),


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