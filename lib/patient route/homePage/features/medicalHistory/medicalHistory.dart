import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:docmate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/sharedComponent.dart';
import 'allergy/allergies.dart';
import 'familyHistory/family_history.dart';
class MedicalHistoryScreen extends StatelessWidget {
    int index;
   MedicalHistoryScreen({required this.index,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold(
            appBar:themeAppBar(context, value:" Medical History"),
            body: Padding(padding: const EdgeInsets.all(32.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FeatureCard(
                        width: 320, height: 240,
                        textSize: 20, icoWidth: 100, iconHeight: 100,
                        ontap: () {
                          navigateTo(context,const FamilyHistoryScreen());
                          if(cubit.isUser)
                          {//doctor
                            cubit.getDoctorFamilyHistoryAPI(patientId,index);
                          }
                          else
                          {//patient
                            cubit.getFamilyHistoryAPI();
                          }
                          },
                        color: const Color(0xffDFC8FC),
                        text: "Family History",
                        photoIconName: "family"),
                    const SizedBox(
                      height: 40,
                    ),
                    FeatureCard(
                        width: 320, height: 240,
                        textSize: 20, icoWidth: 100, iconHeight: 100,
                        ontap: () {navigateTo(context, AllergyScreen());
                          if(cubit.isUser) {
                            //user ==true =>doctor
                              cubit.getDoctorAllergyAPI(patientId,index);
                            }
                          else {
                            //user ==false =>patient
                              cubit.getPatientAllergyAPI();
                            }},
                        color: const Color(0xffFFCCA0),
                        text: "Allergies",
                        photoIconName: "allergies"),

                  ]),
            ),
          );
        });
  }
}