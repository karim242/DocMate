

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
  static String profileID = "IDPatientProfile";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPatientCubit,RegisterStates>(
        listener: (context, states) {},
        builder: (context, states) {

          RegisterPatientCubit cubit = RegisterPatientCubit.get(context);
          SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
              statusBarColor: blueColor
          ));
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
                        const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://via.placeholder.com/140x100')
                        ),
                        Text(cubit.nameController.value.text, style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        Text(cubit.emailRegisterController.value.text, style: const TextStyle(fontSize: 12),)
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
                        MyInfoWidget(title: 'phone', info: cubit.phoneController.value.text),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Date Of Birth', info: cubit.dateOfBirthController.value.text,),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Height', info: cubit.heightController.value.text,),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Weight', info: cubit.weightController.value.text,),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Blood type', info: cubit.bloodTypeController.value.text,),
                        const SizedBox(height: 10,),
                        MyInfoWidget(title: 'Location', info: cubit.addressController.value.text,),

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
        Text(title,style: text20ForNameAdd),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),

            child:Text(info,style: const TextStyle(
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
