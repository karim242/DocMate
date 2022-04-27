

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../../constant.dart';

import '../../../../../shared/sharedComponent.dart';

class ADDGlucoseScreen extends StatelessWidget {
  const ADDGlucoseScreen({Key? key}) : super(key: key);
  static String idADDGlucose = "IDADDGlucoseScreen";

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
                  "Add Glucose  ",
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

                          fieldForMeasurement(
                            controller: cubit.measurementGlucoseController,
                      ),
                      const SizedBox(height: 10),
                      Text("Type",style: text20ForNameAdd,),
                      Container(
                        width: 176,
                        height: 44,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: DropdownButton(
                          onChanged: (String? value) {
                            cubit.selectedType = value;
                            cubit.emit(LoadingValueStates());
                          },
                          isExpanded: true,
                          iconSize: 30.0,
                          value: cubit.selectedType,
                          items: cubit.types.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),


                      const SizedBox(height: 10),
                      TextAndField(text: "Date",
                          controller: cubit.dateGlucoseController,
                          ontap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2020),
                              lastDate: DateTime.utc(2025),
                            ).then((value) {
                              cubit.dateGlucoseController.text=
                                  DateFormat('yyyy-MM-dd').format(value!);
                            });
                          }
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/2.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          saveBotton(
                              onpressed: () {
                                if (cubit.formkey.currentState!.validate()) {

                                  cubit.postGlucoseAPI();
                                  cubit.getGlucoseAPI();

                                   Navigator.pop(context);
                                cubit.measurementGlucoseController.clear();
                                cubit.dateGlucoseController.clear();
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
