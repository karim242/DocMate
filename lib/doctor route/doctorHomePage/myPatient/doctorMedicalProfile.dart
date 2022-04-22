


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
import '../../../patient route/homePage/features/Vaccines/vaccines.dart';
import '../../../patient route/homePage/features/blood&glucose/blood&glucose.dart';
import '../../../patient route/homePage/features/labtest/labTest.dart';
import '../../../patient route/homePage/features/medicalHistory/medicalHistory.dart';
import '../../../patient route/homePage/features/radiology/radiology.dart';
import '../../../patient route/homePage/features/surgery/surgery.dart';
import '../../../shared/sharedComponent.dart';

class DoctorMedicalProfileScreen extends StatelessWidget {
  //static String doctorMedicalProfileID = "IdOfMedicalProfile";
  String patientId ;
  String patientName;
  ImageProvider patientImage;

  DoctorMedicalProfileScreen({Key? key,
    required this.patientId,
    required this.patientName,
    required this.patientImage
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: blueColor,
              elevation: 0,
            ),

            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context).size.height / 5,
                  decoration:  BoxDecoration(
                      color: blueColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(40))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //remove const when using api
                    children:  [
                       CircleAvatar(
                          radius: 30,
                          backgroundImage: patientImage
                      ),
                      Text(patientName,
                          style: textTitle22Style),
                       Text(patientId,
                        style:
                        const TextStyle(fontSize: 12),)
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.04,
                      children: [

                        FeatureCard(

                            ontap: (){
                              Navigator.pushNamed(context, MedicalHistoryScreen.idMedicalHistory);
                            },
                            photoIconName: "medical_history",
                            textSize: 14.5,
                            text: "Medical History",
                            color: const Color(0xffDFC8FC)),
                        FeatureCard(
                            ontap: (){},
                            photoIconName: "medical_Visit",
                            text: "Medical Visit",
                            color: const Color(0xffFFCCA0)),
                        FeatureCard(
                            ontap: (){
                              Navigator.pushNamed(
                                  context, VaccineScreen.idVaccine);
                            },
                            photoIconName: "vaccine",
                            text: "Vaccines ", color: const Color(0xffBBEAFE)),
                        FeatureCard(
                            ontap: (){
                              Navigator.pushNamed(context, RadiologyScreen.idRadiology);
                            },
                            photoIconName: "radiology",
                            text: "Radiology", color: const Color(0xffADFFDF)),
                        FeatureCard(
                            ontap: (){
                              Navigator.pushNamed(context, LabTestScreen.idLabTest);
                            },
                            photoIconName: "labtest",
                            text: "Lab Test", color: const Color(0xffDEE0DF)),
                        FeatureCard(
                            ontap: (){
                              Navigator.pushNamed(
                                  context, BloodGlucoseScreen.idBloodGlucose);
                            },
                            photoIconName: "4",
                            text: "Blood&Glucose",
                            color: const Color(0xffFFB5B5)),
                        FeatureCard(
                            ontap: (){
                              Navigator.pushNamed(context, SurgeryScreen.idSurgery );
                            },
                            photoIconName: "surgery",
                            text: "Surgery", color: const Color(0xffBAFFB5)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

    );
  }
}