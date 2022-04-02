
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../network_helper/cubit/networkCubit.dart';
import '../../../../../network_helper/cubit/networlStates.dart';
import '../../../../../shared/sharedComponent.dart';

class ADDAllergyScreen extends StatelessWidget {
  const ADDAllergyScreen({Key? key}) : super(key: key);
  static String idADDAllergy = "IDADDAllergy";

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
                title: Center(
                  child: Text(
                    " Add Allergy",
                    style: textTitle22Style,
                  ),
                ),
              ),
            body:Form(
                key: cubit.formkey,
            child :SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    TextAndField(
                      ontap: (){},
                      text: "Allergy",
                      controller: cubit.allergyController,
                    ),

                     SizedBox(
                      height: MediaQuery.of(context).size.height/1.8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultBotton(
                            text: "Save", colour: blueColor,
                            onpressed: () {
                              if (cubit.formkey.currentState!.validate()) {
                                cubit.AddAllergyValue(
                                    cubit.allergyController.value.text);
                                Navigator.pop(context);
                                cubit.allergyController.clear();
                              }
                            }
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        defaultBotton(
                            text: "Cancel", colour: Colors.grey[100],
                            onpressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
            ),
          );
        }
    );
  }
}
