
import 'package:docmate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addBloodPressure.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({Key? key}) : super(key: key);
  static String idBloodPressure = "idBloodPressureScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> pressurePatientData = cubit.pressurePatientData;
          List<dynamic> pressureDoctorData = cubit.pressureDoctorData;

          return Scaffold(
            appBar: themeAppBar(context, value: "Blood Pressure"),
            floatingActionButton: buildFloatingActionButton(
                context,
                routeName: ADDBloodPressureScreen.idADDBloodPressure),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: cubit.isUser?pressureDoctorData.length:pressurePatientData.length,
                itemBuilder: (context, index) =>
                    pressureWidget(context,
                        measure1:
                        cubit.isUser
                            ?pressureDoctorData[index]["systolic_pressure"]
                            :pressurePatientData[index]["systolic_pressure"],
                        measure2:
                        cubit.isUser
                            ?pressureDoctorData[index]["diastolic_pressure"]
                            : pressurePatientData[index]["diastolic_pressure"],
                        date:
                        cubit.isUser
                            ?pressureDoctorData[index]["date"]
                            :pressurePatientData[index]["date"],
                    ),


              ),
            ),
          );
        }
    );
  }
}

Widget pressureWidget(BuildContext context,{
  required int measure1,
  required int measure2,
  required String date,

}) {
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
                            date,
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
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    color: whiteColor,
                    child: Column(
                        children: [
                          Text("${measure1.toString()}/${measure2.toString()}",
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
            );
  }


