import 'package:docmate/doctor%20route/doctorFeature/medicalVisit/showMedicalVisit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';
import 'addMedicalVisit.dart';
class DrMedicalVisit extends StatelessWidget {
  const DrMedicalVisit({Key? key}) : super(key: key);
  static String idDrMedicalVisit = "idDrMedicalVisit";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
              appBar: themeAppBar(context, value: "Medical Visit"),
              floatingActionButton:
              buildFloatingActionButton(context,
                  routeName: AddMedicalVisits.idAddMedicalVisit,
              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView.builder(
                    itemBuilder: (context, index) => MedicalVisitCard(
                        patientData:"2022/10/10" ,
                        doctorName: "Dr/ Omar Mohammed",
                        doctorImage: const AssetImage("images/4.png")),
                  itemCount: 2,
                )
                ,
              )
          );
        }
    );
  }
}class MedicalVisitCard extends StatelessWidget {

  late String patientData ;
  late String? doctorName;
  late ImageProvider? doctorImage;

  MedicalVisitCard({Key? key,
    required this.patientData,
    required this.doctorName,
    required this.doctorImage,
  }) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(height: 80,
        onPressed: () {
          navigateTo(context, ShowMedicalVisits(
            doctorName: doctorName,
            doctorImage: doctorImage,));},
        elevation: 2, color: whiteColor,
        highlightColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.all(5.0),
              child: Container(height: 60, width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(16),),
                child: Image(
                  image: doctorImage!,
                  fit: BoxFit.fill,),),),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorName!,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: blueColor,),),
                const SizedBox(height: 5,),
                Text("Date: $patientData",style: text15forDateandTime),],),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}