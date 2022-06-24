import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../network_helper/cubit/networkCubit.dart';
import '../../../network_helper/cubit/networlStates.dart';
import '../../../shared/sharedComponent.dart';


class VerifyOtp extends StatelessWidget {
  const VerifyOtp({Key? key}) : super(key: key);
  static String idOVerifyOtp = "IdOfVerifyOtp";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {
          if(states is  OtpVerifySuccessStates)
          {
            showToast(
                msg: states.verifyOtpModel.message,
                states: ToastStates.SUCCESS
            );
           // navigateTo(context, DoctorMedicalProfileScreen(cu,));
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
                children: [Column(
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
                              Text(cubit.findPatientList[0]["name"], style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Column(
                          children: [
                            Text("you don't have permission yet to view this profile",style: TextStyle(color: blueColor,fontSize: 22,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                            const SizedBox(height: 40),

                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width/1.8,
                              child: TextFormField(
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                controller: cubit.verifyOtpController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),

                                  ),
                                  fillColor: whiteColor,
                                  filled: true,
                                  errorStyle: const TextStyle(height: .8, color: Colors.red),
                                  labelText: '  Enter the number',
                                  labelStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10,),

                            MaterialButton(
                              height: 44,
                              minWidth: 180,
                              onPressed: (){
                             cubit.postOtpVerify(context);

                            },child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('confirm',style: TextStyle(fontSize: 22,color: Colors.white),),
                            ),color: blueColor,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),),
                          ],
                        ),


                      ],


                    )
                ],
              )

            ),
          );
        }
    );
  }
}
