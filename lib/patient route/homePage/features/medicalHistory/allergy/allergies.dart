import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../network_helper/cubit/networkCubit.dart';
import '../../../../../network_helper/cubit/networlStates.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addAllergy.dart';

class AllergyScreen extends StatelessWidget {
   AllergyScreen({Key? key}) : super(key: key);
  static String idAllergyScreen = "IDAllergyScreen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          NetworkCubit cubit = NetworkCubit.get(context);
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
                              text: "* ${cubit.listOfallergyValue[index].toString()}",
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