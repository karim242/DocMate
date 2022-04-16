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
  static String idRadiology = "IdRadiologyScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {

          return Scaffold(
              appBar: themeAppBar(context, value: "Radiology"),
              floatingActionButton:
              buildFloatingActionButton(context,
                  routeName: AddRadiologyScreen.idAddRadiology),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                        vaccineName:"Normal X-ray",
                        type: " X-rays ",
                        location: "MU ",
                        date: "2021-4-28",
                        vaccineImage: const NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?"
                                "q=tbn:ANd9GcTfMDrgJ0RwpvOOi6b2qxMODpMXHdUOCIdL7g"
                                "&usqp=CAU"
                        ),
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