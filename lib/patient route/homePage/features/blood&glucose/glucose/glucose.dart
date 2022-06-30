
import 'package:docmate/Blocs/featureBloc/featureStates.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../network_helper/cubit/networkCubit.dart';
import '../../../../../network_helper/cubit/networlStates.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addGlucose.dart';

class GlucoseScreen extends StatelessWidget {
  const GlucoseScreen({Key? key}) : super(key: key);
  static String idGlucose = "idGlucoseScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List <dynamic> glucosePatientData=cubit.glucosePatientData;
          List <dynamic> glucoseDoctorData=cubit.glucoseDoctorData;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: themeAppBar(context, value: " Glucose"),
            floatingActionButton: buildFloatingActionButton(
                context,
                routeName: ADDGlucoseScreen.idADDGlucose,
                ontap: (){}),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
              itemCount:cubit.isUser?glucoseDoctorData.length:glucosePatientData.length,
                //glucosePatientData.length,
                itemBuilder: (context, index)
                => glucoseWidget(context,
                  date: cubit.isUser?glucoseDoctorData[index]["date"]:glucosePatientData[index]["date"],
                  measure: cubit.isUser?glucoseDoctorData[index]["glucos_result"]:glucosePatientData[index]["glucos_result"],
                  type:cubit.isUser?glucoseDoctorData[index]["glucos_type"]: glucosePatientData[index]["glucos_type"],
                ),

              ),
            ),
          );
        }
    );
  }


}

Widget glucoseWidget(context,
{
required int measure,
required String date,
  required String type,
})
{
    return Column(
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
                    date.toString(),
                    style:text15forDateandTime
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
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: whiteColor,
            child: Column(
                children: [
                  Text(
                    measure.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: blueColor
                    ),),
                  const SizedBox(height: 5,),
                  Text(
                      "Type: $type",
                      style: text15forDateandTime
                  ),
                  const SizedBox(height: 5,),
                ]

            ),
          ),
        ]
    );
}
