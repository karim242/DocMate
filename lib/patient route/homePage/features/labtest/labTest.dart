


import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'addlabtest.dart';

class LabTestScreen extends StatelessWidget {
  const LabTestScreen({Key? key}) : super(key: key);
  static String idLabTest = "IdLabTestScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List <dynamic> labTestData = cubit.labTestData;

          return Scaffold(
              appBar: themeAppBar(context, value: "Lab Test"),
              floatingActionButton:
              buildFloatingActionButton(context,
                  routeName:  AddLabTestScreen.idAddLabTest),

              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                         name:labTestData[index]["name"],
                         type:labTestData[index]["type"],
                     location:labTestData[index]["location"],
                        date: labTestData[index]["date"],
                        // image: const NetworkImage(
                        //     "https://encrypted-tbn0.gstatic.com/images?"
                        //         "q=tbn:ANd9GcSMIjtLGdKhn6rI-5J738fL-"
                        //         "iX8N9HBZYAEPQ&usqp=CAU"
                        // ),
                      ),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: labTestData.length,
                ),
              ));
        });
  }
}