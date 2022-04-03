


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
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          NetworkCubit cubit = NetworkCubit.get(context);

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
                        vaccineName:"Sugar",
                        type: " X-rays ",
                        location: "MU ",
                        date: "2021-4-28",
                        vaccineImage: const NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?"
                                "q=tbn:ANd9GcSMIjtLGdKhn6rI-5J738fL-"
                                "iX8N9HBZYAEPQ&usqp=CAU"
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: 5,
                      ),
                  itemCount: 1,
                ),
              ));
        });
  }
}