import 'package:docmate/doctor%20route/doctorFeature/medicalVisit/showMedicalVisit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';
import 'addMedicalVisit.dart';

class DrMedicalVisit extends StatelessWidget {
  static String idDrMedicalVisit = "idDrMedicalVisit";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> allPrescriptionData= cubit.allPrescriptionData;
          return Scaffold(
              appBar: themeAppBar(context, value: "Medical Visit"),
              floatingActionButton: FloatingActionButton(onPressed: () {
                cubit.getPrescriptionIDAPI(patientId);
                navigateTo(context,  AddMedicalVisits());
              },

              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => MedicalVisitCard(
                    ontap: (){cubit.getAllPrescriptionAPI(patientId);},
                      patientData: allPrescriptionData[index]["date"],
                      doctorName: "Dr/${allPrescriptionData[index]["doctor_name"]}",
                      doctorImage: const  NetworkImage(
                      'https://encrypted-tbn2.gstatic.com/'
                          'images?q=tbn:ANd9GcSQntRPY-paKdW16dfSuNGw-aXz6t3fWCm3KlEMwM5YO7BbXge_')),
                  itemCount: allPrescriptionData.length,
                ),
              ));
        });
  }
}

class MedicalVisitCard extends StatelessWidget {
  late String patientData;
  late String? doctorName;
  Function ontap;
  late ImageProvider? doctorImage;

  MedicalVisitCard({
    Key? key,
    required this.ontap,
    required this.patientData,
    required this.doctorName,
    required this.doctorImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 80,
        onPressed: () {
     ontap;
          navigateTo(context, ShowMedicalVisits(
                doctorName: doctorName,
                doctorImage: doctorImage,
              ),
          );
        },
        elevation: 2,
        color: whiteColor,
        highlightColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: CircleAvatar(
                  backgroundImage: doctorImage!,
                  radius: 60,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: blueColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("Date: $patientData", style: text15forDateandTime),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
