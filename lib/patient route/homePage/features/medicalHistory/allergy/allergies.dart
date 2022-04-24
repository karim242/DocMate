import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../../constant.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addAllergy.dart';

class AllergyScreen extends StatelessWidget {
   AllergyScreen({Key? key}) : super(key: key);
  static String idAllergyScreen = "IDAllergyScreen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
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
                          crossAxisSpacing:10.0,
                          mainAxisSpacing: 10.0
                        ),
                        itemCount:cubit.listOfallergyValue.length ,
                        itemBuilder: (context, int index){
                          return  FeatureCard(
                              textcolor :blueColor,
                              ontap: () {},
                              photoIconName: "allergy",
                              text: "* ${cubit.listOfallergyValue[index]}",
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