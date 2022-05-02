import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:docmate/constant.dart';
import 'package:docmate/patient%20route/homePage/features/blood&glucose/glucose/glucose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/sharedComponent.dart';
import 'bloodPressure/bloodpressure.dart';

class BloodGlucoseScreen extends StatelessWidget {
  int index;
   BloodGlucoseScreen({required this.index,Key? key}) : super(key: key);
  static String idBloodGlucose = "idBloodGlucose";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold(
            appBar:themeAppBar(context, value:" Blood & Glucose"),
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FeatureCard(
                        width: 320,
                        height: 240,
                        textSize: 20,
                        icoWidth: 100,
                        iconHeight: 100,
                        ontap: () {
                         navigateTo(
                              context,const BloodPressureScreen());
                         if(cubit.isUser)
                         {//doctor
                           cubit.getDoctorPressureAPI(patientId,index);
                         }
                         else
                         {//patient
                           cubit.getPatientPressureAPI();

                         }
                        },
                        color: const Color(0xff7C8F9A),
                        text: "Blood pressure",
                        photoIconName: "BloodPressure"),
                    const SizedBox(
                      height: 40,
                    ),
                    FeatureCard(
                        width: 320,
                        height: 240,
                        textSize: 20,
                        icoWidth: 100,
                        iconHeight: 100,
                        ontap: () {
                         navigateTo(context, const GlucoseScreen());
                         if(cubit.isUser)
                           {//doctor
                             cubit.getDoctorGlucoseAPI(patientId,index);
                           }
                         else
                         {//patient
                           cubit.getPatientGlucoseAPI();
                         }
                         },
                        color: const Color(0xff276497),
                        text: "Glucose",
                        photoIconName: "Glucose"),


                  ]),
            ),
          );
        });
  }
}