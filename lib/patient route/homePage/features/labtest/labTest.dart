import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/sharedComponent.dart';
import 'addlabtest.dart';
class LabTestScreen extends StatelessWidget {
  const LabTestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List <dynamic> labTestPatientData = cubit.labTestPatientData;
          List <dynamic> labTestDoctorData = cubit.labTestDoctorData;

          return Scaffold(
              appBar: themeAppBar(context, value: "Lab Test"),
              floatingActionButton:
              buildFloatingActionButton(context,
              routeName:  AddLabTestScreen.idAddLabTest,
                  ontap: (){}),
              body: Padding(padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                         name:cubit.isUser?labTestDoctorData[index]["name"]:labTestPatientData[index]["name"],
                         type:cubit.isUser?labTestDoctorData[index]["type"]:labTestPatientData[index]["type"],
                     location:cubit.isUser?labTestDoctorData[index]["location"]:labTestPatientData[index]["location"],
                       date:  cubit.isUser?labTestDoctorData[index]["date"]:labTestPatientData[index]["date"],
                      // image: cubit.profileImage
                      ),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: cubit.isUser?labTestDoctorData.length:labTestPatientData.length,
                ),
              ));
        });
  }
}

