import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../Blocs/featureBloc/featurecubit.dart';
import 'addVaccines.dart';
class VaccineScreen extends StatelessWidget {
  const VaccineScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> vaccinePatientData=cubit.vaccinePatientData;
          List<dynamic> vaccineDoctorData=cubit.vaccineDoctorData;
          return Scaffold(
              appBar: themeAppBar(context, value: "Vaccines"),
              floatingActionButton: buildFloatingActionButton(context,
                  routeName: AddVaccineScreen.idAddVaccine),
              body: Padding(padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                          name: cubit.isUser?vaccineDoctorData[index]["name"]:vaccinePatientData[index]["name"],
                          type: cubit.isUser?vaccineDoctorData[index]["type"]:vaccinePatientData[index]["type"],
                      location: cubit.isUser?vaccineDoctorData[index]["location"]:vaccinePatientData[index]["location"],
                          date: cubit.isUser?vaccineDoctorData[index]["date"]:vaccinePatientData[index]["date"],),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: cubit.isUser?vaccineDoctorData.length:vaccinePatientData.length,
                ),
              ));
        });
  }
}
