import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../../constant.dart';
import '../../../../../shared/sharedComponent.dart';
import 'family_history.dart';

class ADDFamilyHistoryScreen extends StatelessWidget {
  const ADDFamilyHistoryScreen({Key? key}) : super(key: key);
  static String idADDFamilyHistory = "IdADDFamilyHistory";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(
                  "Add Family History",
                  style: textTitle22Style,
                ),
              ),
            ),
            body: Form(
              key: cubit.formkey,
            child :SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    TextAndField(
                      ontap: (){},

                      text: "Disease",
                      controller: cubit.diseaseFamilyController,
                    ),
                    TextAndField(
                      ontap: (){},
                      text: "Relation",
                      controller: cubit.relationFamilyController,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height/2
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        saveBotton(

                            onpressed: () {
                              if(cubit.formkey.currentState!.validate()){
                                if (cubit.isUser)
                                { //doctor
                                  cubit.postFamilyDoctorAPI(patientId);

                                }
                                else
                                {//patient
                                  cubit.postFamilyPatientAPI();
                                }
                             // cubit.getFamilyHistoryAPI();
                             // cubit.emit(InitStates());
                                Navigator.pop(context);
                               // navigateAndReplacment(context,const FamilyHistoryScreen());
                              cubit.diseaseFamilyController.clear();
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