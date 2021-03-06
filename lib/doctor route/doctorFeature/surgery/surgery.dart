
import 'dart:io';

import 'package:docmate/doctor%20route/doctorFeature/surgery/addSurgery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../shared/sharedComponent.dart';

class DoctorSurgeryScreen extends StatelessWidget {
  const DoctorSurgeryScreen({Key? key}) : super(key: key);
  static String idDoctorSurgery = "IdDrSurgeryScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> surgeryPatientData= cubit.surgeryPatientData;
          List<dynamic> surgeryDoctorData= cubit.surgeryDoctorData;
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: themeAppBar(context, value: "Surgery"),
              floatingActionButton: buildFloatingActionButton(context,
              routeName:AddSurgeryScreen.idAddSurgery,
                  ontap: (){}),

              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                        name:cubit.isUser?surgeryDoctorData[index]["name"]:surgeryPatientData[index]["name"],
                        type:cubit.isUser?surgeryDoctorData[index]["type"]:surgeryPatientData[index]["type"],
                    location:cubit.isUser?surgeryDoctorData[index]["location"]:surgeryPatientData[index]["location"],
                        date:cubit.isUser?surgeryDoctorData[index]["date"]:surgeryPatientData[index]["date"],
                       image: const NetworkImage(
                          "https://www.researchgate."
                              "net/profile/Sylvia-Asa/publication/319357366/"
                              "figure/fig2/AS:613886776573952@1523373421045/"
                              "The-consolidated-theranostic-report-surgical-"
                              "pathology-An-example-deidentified-to.png"),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount:cubit.isUser?surgeryDoctorData.length:surgeryPatientData.length,
                ),
              ));
        });
  }
}