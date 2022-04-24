
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';

class AddMedicalVisits extends StatelessWidget {
  const AddMedicalVisits({Key? key}) : super(key: key);
  static String idAddMedicalVisit = "idAddMedicalVisit";



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
                  " Add Medical Visit",
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
                        Text(
                          "Prescription",
                          style: text20ForNameAdd,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 24, 35, 24),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  iconSize: 35.0,
                                  onPressed: () {
                                   cubit.takePhoto(ImageSource.gallery
                                    ).then((value) =>
                                     cubit.imageOfPrescription=value as TextEditingController );
                                  },
                                ),
                                const Text("Upload Image"),
                              ],
                            ),
                          ),
                        ) ,
                        TextAndField(
                          ontap: (){},
                          text : "Summary",
                          controller: cubit.summaryController,
                        ),
////Still don't put Active Sub
                        TextAndField(
                          ontap: (){},
                          text : "Notes",
                          controller: cubit.notesController,
                        ),
                        TextAndField(
                          ontap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2020),
                              lastDate: DateTime.utc(2025),
                            ).then((value) {
                              cubit.medicalVisitDateController.text=DateFormat.yMd().format(value!);
                            });
                          },
                          text : "Date",
                          controller: cubit.medicalVisitDateController,
                        ),
                        const SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            saveBotton(

                                onpressed: () {
                                  if (cubit.formkey.currentState!.validate())
                                  {
                                    cubit.addMedicalVisit();
                                    Navigator.pop(context);
                                    cubit.summaryController.clear();
                                    cubit.notesController.clear();
                                    cubit.medicalVisitDateController.clear();


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