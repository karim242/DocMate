import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';

class SurgeryScreen extends StatelessWidget {
  const SurgeryScreen({Key? key}) : super(key: key);
  static String idSurgery = "IdSurgeryScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {

          return Scaffold(
              appBar: themeAppBar(context, value: "Vaccines"),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                          vaccineName:"BackBone",
                          type: " CT ",
                          location: "MU ",
                          date: "2021-4-28",
                          vaccineImage: const NetworkImage(
                              "https://www.researchgate."
                                  "net/profile/Sylvia-Asa/publication/319357366/"
                                  "figure/fig2/AS:613886776573952@1523373421045/"
                                  "The-consolidated-theranostic-report-surgical-"
                                  "pathology-An-example-deidentified-to.png"),
                      ),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: 1,
                ),
              ));
        });
  }
}