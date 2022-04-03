
import 'package:docmate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../network_helper/cubit/networkCubit.dart';
import '../../../../../network_helper/cubit/networlStates.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addBloodPressure.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({Key? key}) : super(key: key);
  static String idBloodPressure = "idBloodPressureScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          // NetworkCubit cubit = NetworkCubit.get(context);

          return Scaffold(
            appBar: themeAppBar(context, value: "Blood Pressure"),
            floatingActionButton: buildFloatingActionButton(
                context,
                routeName: ADDBloodPressureScreen.idADDBloodPressure),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index)
                => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        line(context),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "2021-10-16",style:text15forDateandTime
                          ),
                        ),
                        line(context),

                      ],
                    ),
                    const SizedBox(height: 5,),
                    MaterialButton(
                      minWidth: 160,
                      height: 100,
                      onPressed: (){},
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: whiteColor,
                      child: Column(
                          children: [
                            Text("85/130",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: blueColor
                              ),),
                            const SizedBox(height: 5,),

                          ]

                      ),
                    ),
                  ]
              ),


            ),
            ),
          );
        }
    );
  }
}

