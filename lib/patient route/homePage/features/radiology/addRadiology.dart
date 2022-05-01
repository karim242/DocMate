import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../constant.dart';
import '../../../../shared/sharedComponent.dart';

class AddRadiologyScreen extends StatelessWidget {
  const AddRadiologyScreen({Key? key}) : super(key: key);
  static String idAddRadiology = "IdAddRadiologyScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {

          FeatureCubit cubit = FeatureCubit.get(context);
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
                                  onPressed: () {
                                    cubit.takePhoto(ImageSource.gallery);
                                  },
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
                              cubit.dateRadiologyController.text=
                                  DateFormat('yyyy-MM-dd').format(value!);
                            });
                          },
                          text : "Date",
                          controller: cubit.dateRadiologyController,
                        ),
                        gap4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            saveBotton(

                                onpressed: () {
                                  if (cubit.formkey.currentState!.validate()) {
                                    cubit.radiologyAPI();
                                    cubit.getRadiologyPatientAPI();

                                    Navigator.pop(context);
                                    cubit.radiologyNameController.clear();
                                    cubit.radiologyTypeController.clear();
                                    cubit.radiologyLocationController.clear();
                                    cubit.dateRadiologyController.clear();

                                  }
                                }
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            cancelBotton(
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