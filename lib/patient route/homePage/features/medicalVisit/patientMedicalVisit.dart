import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/patient%20route/homePage/features/medicalVisit/showPatientMV.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../doctor route/doctorFeature/medicalVisit/medicalVisit.dart';
import '../../../../shared/sharedComponent.dart';

class PatientMedicalVisit extends StatelessWidget {
  const PatientMedicalVisit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit  cubit = FeatureCubit.get(context);
          List<dynamic> prescriptionData=cubit.prescriptionPatientData;
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: themeAppBar(context, value: "Medical Visit"),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => MedicalVisitCard(
                      GoTo :ShowPatientMedicalVisits(indexItem: index),
                      patientData:prescriptionData[index]["date"] ,
                      doctorName: "Dr/${ prescriptionData[index]["doctor_name"]}",
                      doctorImage: const NetworkImage(
                          'https://encrypted-tbn2.gstatic.com/'
                              'images?q=tbn:ANd9GcSQntRPY-paKdW16dfSuNGw-aXz6t3fWCm3KlEMwM5YO7BbXge_')
                  ),
                  itemCount: prescriptionData.length,
                )
                ,
              )
          );
        }
    );
  }
}