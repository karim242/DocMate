import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../constant.dart';

import '../../../../shared/sharedComponent.dart';
import 'package:intl/intl.dart';


class AddVaccineScreen extends StatelessWidget {
  const AddVaccineScreen({Key? key}) : super(key: key);
  static String idAddVaccine = "IdADDVaccineScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states){
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(
                  " Add Vaccine ",
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
                                icon: Icon(Icons.camera_alt_outlined),
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
                        controller: cubit.vaccineNameController,
                      ),
                      TextAndField(
                        ontap: (){},
                        text : "Type",
                        controller: cubit.vaccineTypeController,
                      ),
                      TextAndField(
                        ontap: (){},
                        text : "Location",
                        controller: cubit.vaccineLocationController,
                      ),
                      TextAndField(
                        ontap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(2020),
                            lastDate: DateTime.utc(2025),
                          ).then((value) {
                            cubit.dateVaccineController.text=DateFormat('yyyy-MM-dd').format(value!);
                          });
                        },
                        text : "Date",
                        controller: cubit.dateVaccineController,
                      ),
                      SizedBox(height: 70,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          saveBotton(

                              onpressed: () {
                                if (cubit.formkey.currentState!.validate()) {
                                  cubit.vaccineAPI();
                                  cubit.getVaccinePatientAPI();

                                  Navigator.pop(context);
                                  cubit.vaccineNameController.clear();
                                  cubit.vaccineTypeController.clear();
                                  cubit.vaccineLocationController.clear();
                                  cubit.dateVaccineController.clear();

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
