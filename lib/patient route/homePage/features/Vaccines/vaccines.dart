import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../Blocs/featureBloc/featurecubit.dart';
import 'addVaccines.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({Key? key}) : super(key: key);
  static String idVaccine = "IdVaccineScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> vaccineData=cubit.vaccineData;
          return Scaffold(
              appBar: themeAppBar(context, value: "Vaccines"),

              floatingActionButton: buildFloatingActionButton(
                  context,
                  routeName: AddVaccineScreen.idAddVaccine
              ),

              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ThemeCard(context,
                          name: vaccineData[index]["name"],
                          type: vaccineData[index]["type"],
                      location: vaccineData[index]["location"],
                          date: vaccineData[index]["date"],
                         // image: vaccineData[index]["image"],
                      ),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: vaccineData.length,
                ),
              ));
        });
  }
}
