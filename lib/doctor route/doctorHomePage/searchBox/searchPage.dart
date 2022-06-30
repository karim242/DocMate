import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/models/searchModel.dart';
import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../network_helper/cubit/networkCubit.dart';
import '../../../network_helper/cubit/networlStates.dart';
import '../myPatient/myPatients.dart';
import 'otp_request.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          NetworkCubit cubit = NetworkCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                " Patients",
                style: textTitle22Style,
              ),
            ),
            body: ConditionalBuilder(
            condition: states is! LoadingSearchValueStates,
          builder: (context) =>Padding(
              padding: const EdgeInsets.all(13.0),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    PatientCard(
                      patientName: cubit.findPatientList[index]["name"],
                      //cubit.findPatientModel.data.name,
                      patientId:cubit.findPatientList[index]["id"],
                      //cubit.findPatientModel.data.id,
                      patientImage: AssetImage("images/4.png"),
                      onpressed: (){
                        navigateTo(context, const OtpRequest());
                      },
                    ),
                itemCount: 1,
              ),
            ),
                fallback: (context)=>const Center(
              child: CircularProgressIndicator(),
          )
          ),
          );
        }
    );
  }
}


