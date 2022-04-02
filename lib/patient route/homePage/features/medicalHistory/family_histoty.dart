import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'addFamilyHistory.dart';

class FamilyHistoryScreen extends StatelessWidget {
  const FamilyHistoryScreen({Key? key}) : super(key: key);
  static String idFamilyHistory = "IdFamilyHistoryScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          // dynamic list= NetworkCubit.get(context).latestNew;
          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data = cubit.latestNew;
          return Scaffold(
              appBar: themeAppBar(context, value: "Family History"),

              floatingActionButton:  buildFloatingActionButton(
                  context,
                  routeName: ADDFamilyHistoryScreen.idADDFamilyHistory
              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(children: [
                  Expanded(
                    child:GridView.builder(
                      padding: EdgeInsets.all(5),
                      shrinkWrap :true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.04,
                          crossAxisSpacing:10.0,
                          mainAxisSpacing: 10.0
                      ),
                      itemCount:cubit.listOfDiseaseValue.length ,
                      itemBuilder: (context, int index){
                        return  FeatureCard(
                            textcolor :blueColor,
                            ontap: () {},
                            photoIconName: "virus",
                            text: " ${cubit.listOfDiseaseValue[index].toString().toUpperCase()}",
                            color: const Color(0xffFDF8FF)
                        );
                      },
                    ),
                  ),
                ]),
              ));
        });
  }
}
