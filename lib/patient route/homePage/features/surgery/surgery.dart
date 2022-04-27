import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../shared/sharedComponent.dart';

class SurgeryScreen extends StatelessWidget {
  const SurgeryScreen({Key? key}) : super(key: key);
  static String idSurgery = "IdPaSurgeryScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> surgeryData= cubit.surgeryData;
          return Scaffold(
              appBar: themeAppBar(context, value: "Surgery"),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                        name:surgeryData[index]["name"],
                        type:surgeryData[index]["type"],
                    location:surgeryData[index]["location"],
                        date:surgeryData[index]["date"],
                       // image:

                      ),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: surgeryData.length,
                ),
              ));
        });
  }
}