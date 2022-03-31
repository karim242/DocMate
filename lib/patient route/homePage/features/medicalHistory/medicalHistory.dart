import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'allergies.dart';
import 'family_histoty.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({Key? key}) : super(key: key);
  static String idMedicalHistory = "IdMedicalHistory";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          // dynamic list= NetworkCubit.get(context).latestNew;
          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data = cubit.latestNew;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title:  Center(
                child: Text(
                    " Medical History",
                    style: textTitleStyle,

                ),
              ),
              leading:IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:const Icon( Icons.arrow_back_ios),

              ) ,
            ),
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