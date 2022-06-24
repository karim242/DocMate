import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/doctor%20route/doctorHomePage/searchBox/verifyotp.dart';
import 'package:docmate/models/searchModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../network_helper/cubit/networkCubit.dart';
import '../../../network_helper/cubit/networlStates.dart';
import '../../../shared/sharedComponent.dart';
import '../myPatient/myPatients.dart';

class OtpRequest extends StatelessWidget {
  const OtpRequest({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {
          if (states is OtpReqSuccessStates) {
            states.requestOtpModel.message == "invalid"
                ? {showToast(
                msg: states.requestOtpModel.message,
                states: ToastStates.SUCCESS),
              navigateTo(context, const VerifyOtp())}
                : {
              showToast(
                  msg: "Something is wrong",
                  states: ToastStates.ERROR
              )
            };
          }
        },
        builder: (context, states) {
          NetworkCubit cubit = NetworkCubit.get(context);

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
                          //remove const when using api
                          children:  [
                            const CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/140x100')
                            ),
                            Text(cubit.findPatientList[0]["name"],
                              style: const TextStyle(fontSize: 22,fontWeight:
                              FontWeight.bold,color: Colors.white),),
                            Text(cubit.findPatientList[0]["id"].toString(),
                            style: const TextStyle(fontSize: 18,color: Colors.white),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),



                    ],
                  ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("you don't have permission yet to view this profile",style: TextStyle(color: blueColor,fontSize: 22,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        ),
                        const SizedBox(height: 15,),
                        MaterialButton(
                          height: 44,
                          minWidth: 200,
                          onPressed: (){
                          cubit.postOtpRequest(context);
                          },child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Request',style: TextStyle(fontSize: 22,color: Colors.white),),
                        ),color: blueColor,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),),
                      ],

                      ),
                    )
                  ]
              ),
            ),
          );
        }
    );
  }
}
