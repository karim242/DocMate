import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../../constant.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addAllergy.dart';

class AllergyScreen extends StatelessWidget {
   AllergyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List <dynamic> allergyPatientData = cubit.allergyPatientListData;
          List <dynamic> allergyDoctorData = cubit.allergyDoctorListData;

          return Scaffold(
              appBar: themeAppBar(context,value: "Allergies"),

              floatingActionButton:  buildFloatingActionButton(
                  context,
                  routeName:ADDAllergyScreen.idADDAllergy),

              body:  Column(children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(18),
                      shrinkWrap :true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.04,
                          crossAxisSpacing:12.0,
                          mainAxisSpacing: 12.0
                        ),
                        itemCount:cubit.isUser?allergyDoctorData.length:allergyPatientData.length ,
                        itemBuilder: (context, int index){
                          return  FeatureCard(
                              textcolor :blueColor,
                              ontap: () {

                              },
                              photoIconName: "allergy",
                              text: cubit.isUser?"*${allergyDoctorData[index]["allergy"]}"
                              :"* ${allergyPatientData[index]["allergy"]}",
                              color: const Color(0xffFDF8FF)
                          );
                        },
                    ),
                  ),
                ]),
              );
        });
  }
}