import 'package:docmate/Blocs/featureBloc/featureStates.dart';
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
              appBar: themeAppBar(context, value: "Medical Visit"),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => MedicalVisitCard(
                    ontap: (){},
                      patientData:prescriptionData[index]["date"] ,
                      doctorName: prescriptionData[index]["name"],
                      doctorImage: const AssetImage("images/4.png")
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