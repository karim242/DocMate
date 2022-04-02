
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../network_helper/cubit/networkCubit.dart';
import '../../../../../network_helper/cubit/networlStates.dart';
import '../../../../../shared/sharedComponent.dart';

class GlucoseScreen extends StatelessWidget {
  const GlucoseScreen({Key? key}) : super(key: key);
  static String idGlucose = "idGlucoseScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          // NetworkCubit cubit = NetworkCubit.get(context);

          return Scaffold(
            appBar: themeAppBar(context, value: " Glucose"),
            floatingActionButton: buildFloatingActionButton(
                context,
                routeName: ""),
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
                              Text(" 85 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: blueColor
                                ),),
                              const SizedBox(height: 5,),
                              Text(
                                  "Type: Random",
                                  style: text15forDateandTime
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                  "Time: 8:30 AM ",
                                  style: text15forDateandTime
                              ),
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