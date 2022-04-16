import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'allergy/allergies.dart';
import 'familyHistory/family_history.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({Key? key}) : super(key: key);
  static String idMedicalHistory = "IdMedicalHistory";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {

          return Scaffold(
            appBar:themeAppBar(context, value:" Medical History"),
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FeatureCard(
                        width: 320,
                        height: 240,
                        textSize: 20,
                        icoWidth: 100,
                        iconHeight: 100,
                        ontap: () {
                          Navigator.pushNamed(context,FamilyHistoryScreen.idFamilyHistory);
                        },
                        color: const Color(0xffDFC8FC),
                        text: "Family History",
                        photoIconName: "family"),
                    const SizedBox(
                      height: 40,
                    ),
                    FeatureCard(
                        width: 320,
                        height: 240,
                        textSize: 20,
                        icoWidth: 100,
                        iconHeight: 100,
                        ontap: () {
                          Navigator.pushNamed(context, AllergyScreen.idAllergyScreen);
                        },
                        color: const Color(0xffFFCCA0),
                        text: "Allergies",
                        photoIconName: "allergies"),


                  ]),
            ),
          );
        });
  }
}