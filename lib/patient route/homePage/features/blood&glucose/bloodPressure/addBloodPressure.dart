
import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../constant.dart';
import '../../../../../network_helper/cubit/networkCubit.dart';
import '../../../../../network_helper/cubit/networlStates.dart';


class ADDBloodPressureScreen extends StatelessWidget {
  const ADDBloodPressureScreen({Key? key}) : super(key: key);
  static String idADDBloodPressure = "IDADDBloodPressureScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          NetworkCubit cubit = NetworkCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(
                  "Add Blood Pressure",
                  style: textTitle22Style,
                ),
              ),
            ),
            body:Form(
              key: cubit.formkey,
              child :SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Measurement",
                        style: text20ForNameAdd,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          fieldForMeasurement(
                            controller: cubit.measurementController1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),

                            child: Text("/",style: text20ForNameAdd,),
                          ),
                          fieldForMeasurement(
                            controller: cubit.measurementController2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      const SizedBox(height: 10),
                      TextAndField(text: "Date",
                          controller: cubit.datePressureController,
                          ontap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2020),
                              lastDate: DateTime.utc(2025),
                            ).then((value) {
                              cubit.datePressureController.text=
                                  DateFormat.yMd().format(value!);
                            });
                          }
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/2.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultBotton(
                              text: "Save", colour: blueColor,
                              onpressed: () {
                                // if (cubit.formkey.currentState!.validate()) {
                                //   cubit.AddAllergyValue(
                                //       cubit.allergyController.value.text);
                                //   Navigator.pop(context);
                                //   cubit.allergyController.clear();
                                // }
                              }
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          defaultBotton(
                              text: "Cancel", colour: Colors.grey[100],
                              onpressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }


}



