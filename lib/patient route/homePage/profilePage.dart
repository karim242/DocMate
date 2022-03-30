import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';

class MedicalProfileScreen extends StatelessWidget {
  const MedicalProfileScreen({Key? key}) : super(key: key);
  static String medicalProfileID = "IdOfMedicalProfile";

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
                  " Profile Page",
                  style: textTitleStyle,
                ),
              ),
            ),

            body: Center(
              child:Container(
              child : Text ("اشتغال يابا")
            ),
          ),
          );
        });
  }
}
