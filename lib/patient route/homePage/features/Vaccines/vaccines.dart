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
                          name: cubit.listOfVaccineNameValue[index],
                          type: cubit.listOfVaccineTypeValue[index],
                          location: cubit.listOfVaccineLocationValue[index],
                          date: cubit.listOfVaccineDateValue[index],
                          image: const NetworkImage(
                              "https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg")),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: cubit.listOfVaccineNameValue.length,
                ),
              ));
        });
  }
}
