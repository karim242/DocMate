import 'package:docmate/doctor%20route/doctorFeature/medicalVisit/medicalVisit.dart';
import 'package:docmate/patient%20route/homePage/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
import '../../../patient route/homePage/features/Vaccines/vaccines.dart';
import '../../../patient route/homePage/features/blood&glucose/blood&glucose.dart';
import '../../../patient route/homePage/features/labtest/labTest.dart';
import '../../../patient route/homePage/features/medicalHistory/medicalHistory.dart';
import '../../../patient route/homePage/features/radiology/radiology.dart';
import '../../../shared/sharedComponent.dart';
import '../../doctorFeature/surgery/surgery.dart';
import '../doctorHomePage.dart';
import '../selectdoctorpage.dart';

class DoctorMedicalProfileScreen extends StatelessWidget {
  //static String doctorMedicalProfileID = "IdOfMedicalProfile";
  int patientId ;
  String pName;
 late int index;
// ImageProvider patientImage;

  DoctorMedicalProfileScreen(  {Key? key,
    required this.patientId,
    required this.pName,
    required this.index
  // required this.patientImage
  })  ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: blueColor,
              elevation: 0,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  navigateAndFinish(context,DoctorSelectPage());
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Column(
              children: [
                MaterialButton(
                  color: blueColor,
                  minWidth: double.infinity,
                  height: MediaQuery
                      .of(context).size.height / 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40))
                  ),
                  onPressed: () {

                  navigateTo(context, const PatientProfileScreen());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //remove const when using api
                    children:  [
                       const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                                    'https://www2.deloitte.com/content/dam/Deloitte/xe/Images/promo_images/'
                                        'profilepictures/Joerg-Meiser.jpg/_jcr_content/renditions/cq5dam.web.250.250.mobile.jpeg')
                         ),
                      Text(pName,
                          style: textTitle22Style),
                       Text(patientId.toString(),
                        style:
                        const TextStyle(fontSize: 12),)
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.04,
                      children: [

                        FeatureCard(

                            ontap: (){
                              navigateTo(context,  MedicalHistoryScreen(index:index));
                            },
                            photoIconName: "medical_history",
                            textSize: 14.5,
                            text: "Medical History",
                            color: const Color(0xffDFC8FC)),
                        FeatureCard(
                            ontap: (){

                              navigateTo(context,  DrMedicalVisit());
                              cubit.getAllPrescriptionAPI(patientId);

                              },
                            photoIconName: "medical_Visit",
                            text: "Medical Visit",
                            color: const Color(0xffFFCCA0)),
                        FeatureCard(
                            ontap: (){navigateTo(context,  const VaccineScreen());
                              cubit.getVaccineDoctorAPI(patientId,);
                              },
                            photoIconName: "vaccine",
                            text: "Vaccines ", color: const Color(0xffBBEAFE)),
                        FeatureCard(
                            ontap: (){navigateTo(context, const RadiologyScreen());
                              cubit.getRadiologyDoctorAPI(patientId,);
                              },
                            photoIconName: "radiology",
                            text: "Radiology", color: const Color(0xffADFFDF)),
                        FeatureCard(
                            ontap: (){navigateTo(context, const LabTestScreen());
                              cubit.getLabTestDoctorAPI(patientId,);
                              },
                            photoIconName: "labtest",
                            text: "Lab Test", color: const Color(0xffDEE0DF)),
                        FeatureCard(
                            ontap: (){navigateTo(context,  BloodGlucoseScreen());},
                            photoIconName: "4",
                            text: "Blood&Glucose",
                            color: const Color(0xffFFB5B5)),
                        FeatureCard(
                            ontap: (){
                              navigateTo(context, const DoctorSurgeryScreen());
                              cubit.getSurgeryDoctorAPI(patientId,);
                              },
                            photoIconName: "surgery",
                            text: "Surgery", color: const Color(0xffBAFFB5)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

    );
  }
}