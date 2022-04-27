
import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../constant.dart';
import '../../../../shared/sharedComponent.dart';

class AddLabTestScreen extends StatelessWidget {
   AddLabTestScreen({Key? key}) : super(key: key);
  static String idAddLabTest = "IdAddLabTestScreen";



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
                  " Add Lab Test ",
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
                                   cubit.takePhoto(ImageSource.gallery
                                   ).then((value) => cubit.labTestImageController=value as TextEditingController);

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
                          controller: cubit.labTestNameController,
                        ),
                        TextAndField(
                          ontap: (){},
                          text : "Type",
                          controller: cubit.labTestTypeController,
                        ),
                        TextAndField(
                          ontap: (){},
                          text : "Location",
                          controller: cubit.labTestLocationController,
                        ),
                        TextAndField(
                          ontap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2020),
                              lastDate: DateTime.utc(2025),
                            ).then((value) {
                              cubit.dateLabTestController.text=DateFormat('yyyy-MM-dd').format(value!);
                            });
                          },
                          text : "Date",
                          controller: cubit.dateLabTestController,
                        ),
                        gap4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            saveBotton(

                                onpressed: () {
                                  if (cubit.formkey.currentState!.validate()) {
                                    cubit.labTestAPI();
                                    cubit.getLabTestAPI();
                                    Navigator.pop(context);
                                    cubit.labTestNameController.clear();
                                    cubit.labTestTypeController.clear();
                                    cubit.labTestLocationController.clear();
                                    cubit.dateLabTestController.clear();

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