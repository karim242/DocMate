import 'package:docmate/patient%20route/homePage/features/labtest/labTest.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/medicalHistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';
import '../../shared/sharedComponent.dart';
import 'features/Vaccines/vaccines.dart';
import 'features/blood&glucose/blood&glucose.dart';
import 'features/radiology/radiology.dart';
import 'features/surgery/surgery.dart';

class MedicalProfileScreen extends StatelessWidget {
  const MedicalProfileScreen({Key? key}) : super(key: key);
  static String medicalProfileID = "IdOfMedicalProfile";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
         // NetworkCubit cubit = NetworkCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(
                  "Medical Profile",
                  style: textTitle22Style,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
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
                ],
              ),
            ),
          );
        }

    );
  }
}
