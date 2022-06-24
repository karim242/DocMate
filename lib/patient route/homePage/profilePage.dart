

import 'package:docmate/Blocs/register/register_cubit.dart';
import 'package:docmate/Blocs/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit,NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          NetworkCubit cubit = NetworkCubit.get(context);
         Map<String,dynamic>patientProfileData=cubit.patientInfoData;

          SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
              statusBarColor: blueColor
          ));
        //  late PatientProfileModel patientProfileModel=cubit.patientProfileModel;
          return Scaffold(
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
                    decoration:  BoxDecoration(
                        color: blueColor,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(40))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //remove const when using api
                      children: [
                        cubit.patientProfileImage == null
                            ? const CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://via.placeholder.com/140x100')

                        )
                            : CircleAvatar(
                            radius: 40,
                            backgroundImage:
                            FileImage(cubit.patientProfileImage!)),

                        Text( patientProfileData.values.elementAt(1),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        Text(patientProfileData.values.elementAt(2), style: const TextStyle(fontSize: 12),)
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
                        MyInfoWidget(title: 'phone', info: patientProfileData.values.elementAt(4)),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Date Of Birth', info: patientProfileData.values.elementAt(3),),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Height', info: patientProfileData.values.elementAt(8).toString(),),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Weight', info:patientProfileData.values.elementAt(7).toString()),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Blood type', info: patientProfileData.values.elementAt(6)),
                        const SizedBox(height: 10,),
                        //MyInfoWidget(title: 'Location', info: cubit.addressController.value.text,),

                      ],
                    ),
                  )


                ],
              ),
            ]
            ),
          );
        });
  }

}

class MyInfoWidget extends StatelessWidget {
  const MyInfoWidget({
    Key? key,
    this.title,
    this.info
  }) : super(key: key);
  final title;
  final info;

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title.toString(),style: text20ForNameAdd),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),

            child:Text(info.toString(),style: const TextStyle(
              fontSize: 18
            ),) ,


            decoration: BoxDecoration(
              color: whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
            )


        )
      ],
    );
  }
}
