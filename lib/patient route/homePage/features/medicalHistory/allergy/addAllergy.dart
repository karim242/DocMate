
import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constant.dart';
import '../../../../../shared/sharedComponent.dart';

class ADDAllergyScreen extends StatelessWidget {
  const ADDAllergyScreen({Key? key}) : super(key: key);
  static String idADDAllergy = "IDADDAllergy";

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
                    " Add Allergy",
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
                  children: [
                    TextAndField(
                      ontap: (){},
                      text: "Allergy",
                      controller: cubit.allergyController,
                    ),

                     SizedBox(
                      height: MediaQuery.of(context).size.height/1.6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        saveBotton(

                            onpressed: () {
                              if (cubit.formkey.currentState!.validate()) {
                                if (cubit.isUser)
                                { //doctor
                                  cubit.postAllergyDoctorAPI(patientId);
                                }
                                else
                                {//patient
                                  cubit.postAllergyAPI();
                                }
                                cubit.getPatientAllergyAPI();

                                Navigator.pop(context);
                                cubit.allergyController.clear();
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
