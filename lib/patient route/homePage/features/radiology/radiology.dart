import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'addRadiology.dart';
class RadiologyScreen extends StatelessWidget {
  const RadiologyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> radiologyPatientData =cubit.radiologyPatientData;
          List<dynamic> radiologyDoctorData =cubit.radiologyDoctorData;
          return Scaffold(
              appBar: themeAppBar(context, value: "Radiology"),
              floatingActionButton:
              buildFloatingActionButton(context,
              routeName: AddRadiologyScreen.idAddRadiology,
                  ontap: (){}
              ),
              body: Padding(padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                        name:cubit.isUser?radiologyDoctorData[index]["name"]:radiologyPatientData[index]["name"],
                        type:cubit.isUser?radiologyDoctorData[index]["type"]:radiologyPatientData[index]["type"],
                    location:cubit.isUser?radiologyDoctorData[index]["location"]:radiologyPatientData[index]["location"],
                        date:cubit.isUser?radiologyDoctorData[index]["date"]:radiologyPatientData[index]["date"],),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: cubit.isUser?radiologyDoctorData.length:radiologyPatientData.length,
                ),
              ));
        });
  }
}