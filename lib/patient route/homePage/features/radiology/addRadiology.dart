import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';

class AddRadiologyScreen extends StatelessWidget {
  const AddRadiologyScreen({Key? key}) : super(key: key);
  static String idAddRadiology = "IdAddRadiologyScreen";

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
                  " Add Radiology ",
                  style: textTitle22Style,
                ),
              ),
            ),
            body: Form(
              key: cubit.formkey,
              child : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 24, 35, 24),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  iconSize: 35.0,
                                  onPressed: () {},
                                ),
                                const Text("Upload Image"),
                              ],
                            ),
                          ),
                        ) ,
                        TextAndField(
                          ontap: (){},
                          text : "Name",
                          controller: cubit.radiologyNameController,
                        ),
                        TextAndField(
                          ontap: (){},
                          text : "Type",
                          controller: cubit.radiologyTypeController,
                        ),
                        TextAndField(
                          ontap: (){},
                          text : "Location",
                          controller: cubit.radiologyLocationController,
                        ),
                        TextAndField(
                          ontap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2020),
                              lastDate: DateTime.utc(2025),
                            ).then((value) {
                              cubit.dateRadiologyController.text=DateFormat.yMd().format(value!);
                            });
                          },
                          text : "Date",
                          controller: cubit.dateRadiologyController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultBotton(
                                text: "Save", colour: blueColor,
                                onpressed: () {
                                  if (cubit.formkey.currentState!.validate()) {

                                    cubit.AddVaccineValue(
                                      name : cubit.vaccineNameController.value.text,
                                      type : cubit.typeController.value.text,
                                      location : cubit.locationController.value.text,
                                      date : cubit.dateVaccineController.value.text,
                                    );
                                    Navigator.pop(context);
                                    cubit.vaccineNameController.clear();
                                    cubit.typeController.clear();
                                    cubit.locationController.clear();
                                    cubit.dateVaccineController.clear();

                                  }
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
                      ]
                  ),


                ),
              ),
            ),
          );
        });
  }
}