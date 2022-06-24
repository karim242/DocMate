import 'package:docmate/Blocs/doctor_register/doctorRegisterCubit.dart';
import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:docmate/doctor%20route/doctorFeature/medicalVisit/showMedicalVisit.dart';
import 'package:docmate/doctor%20route/doctorHomePage/doctorProfile.dart';
import 'package:docmate/doctor%20route/doctorHomePage/searchBox/otp_request.dart';
import 'package:docmate/doctor%20route/doctorHomePage/searchBox/verifyotp.dart';
import 'package:docmate/doctor%20route/signUp/signUpDoctor1.dart';
import 'package:docmate/network_helper/cubit/networkCubit.dart';
import 'package:docmate/network_helper/dioHelper.dart';
import 'package:docmate/patient%20route/homePage/descriptionApi.dart';
import 'package:docmate/patient%20route/homePage/drawe_items/changepassword.dart';
import 'package:docmate/patient%20route/homePage/drawe_items/editprofile.dart';
import 'package:docmate/patient%20route/homePage/features/Vaccines/addVaccines.dart';
import 'package:docmate/patient%20route/homePage/features/Vaccines/vaccines.dart';
import 'package:docmate/patient%20route/homePage/features/blood&glucose/blood&glucose.dart';
import 'package:docmate/patient%20route/homePage/features/blood&glucose/bloodPressure/addBloodPressure.dart';
import 'package:docmate/patient%20route/homePage/features/blood&glucose/bloodPressure/bloodpressure.dart';
import 'package:docmate/patient%20route/homePage/features/blood&glucose/glucose/addGlucose.dart';
import 'package:docmate/patient%20route/homePage/features/blood&glucose/glucose/glucose.dart';
import 'package:docmate/patient%20route/homePage/features/labtest/addlabtest.dart';
import 'package:docmate/patient%20route/homePage/features/labtest/labTest.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/allergy/addAllergy.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/familyHistory/addFamilyHistory.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/allergy/allergies.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/familyHistory/family_history.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/medicalHistory.dart';
import 'package:docmate/patient%20route/homePage/features/radiology/addRadiology.dart';
import 'package:docmate/patient%20route/homePage/features/radiology/radiology.dart';
import 'package:docmate/patient%20route/homePage/features/surgery/surgery.dart';
import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/homePage/profilePage.dart';
import 'package:docmate/patient%20route/homePage/seeAll/latestNews.dart';
import 'package:docmate/patient%20route/homePage/seeAll/medicalAdvices.dart';
import 'package:docmate/patient%20route/homePage/medicalProfile.dart';
import 'package:docmate/patient%20route/homePage/selectPage.dart';
import 'package:docmate/patient%20route/signUp/confirm4digitScreen.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen1.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen2.dart';
import 'package:docmate/selectUser/selectUser.dart';
import 'package:docmate/selectUser/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Blocs/cubit/cubit.dart';
import 'Blocs/login/login_cubit.dart';
import 'Blocs/register/register_cubit.dart';
import 'constant.dart';
import 'doctor route/doctorFeature/medicalVisit/addMedicalVisit.dart';
import 'doctor route/doctorFeature/medicalVisit/medicalVisit.dart';
import 'doctor route/doctorFeature/surgery/addSurgery.dart';
import 'doctor route/doctorFeature/surgery/surgery.dart';
import 'doctor route/signUp/signUpDoctor2.dart';
import 'network_helper/cachehelper/cacheHelper.dart';

Future<void> main() async {
  runApp(const MyApp());
  DioHelperAPI.init();
  DioHelper.init();

  await CacheHelper.init();
  token=CacheHelper.getData(key: "token");
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
      return NetworkCubit()..getLatestNews();
        }),
        BlocProvider(create: (context) {
        return FeatureCubit();
      }),
        BlocProvider(create: (context) {
          return LoginCubit();
        }),
        BlocProvider(create: (context) {
          return RegisterPatientCubit();
        }),
        BlocProvider(create: (context) {
          return UserCubit();
        }),
        BlocProvider(create: (context) {
          return DoctorRegisterCubit();
        }),
      ],
      child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'MplUSRounded1c',
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          //AddMedicalVisits(),
          routes: {

            SignUpPatientScreen.id1: (context) => const SignUpPatientScreen(),
            SignUpPatientScreen2.id2: (context) => const SignUpPatientScreen2(),
            SignUpScreenDoctor1.doctorId1: (context) => const SignUpScreenDoctor1(),
            SignUpScreenDoctor2.doctorId2: (context) => const SignUpScreenDoctor2(),
            ConfirmScreen.id: (context) => const ConfirmScreen(),
            HomePageScreen.homePageID : (context) =>  HomePageScreen(),
            LatestNews.latestNewsID : (context) =>  const LatestNews(),
            MedicalAdvices.medicalAdvicesId : (context) =>  const MedicalAdvices(),
            MedicalProfileScreen.medicalProfileID : (context) => const MedicalProfileScreen(),

            FamilyHistoryScreen.idFamilyHistory : (context)=> const FamilyHistoryScreen(),

            ADDAllergyScreen.idADDAllergy : (context)=> const ADDAllergyScreen(),
            ADDFamilyHistoryScreen.idADDFamilyHistory : (context)=>const ADDFamilyHistoryScreen(),
            AddVaccineScreen.idAddVaccine :(context)=>const AddVaccineScreen(),
            BloodPressureScreen.idBloodPressure : (context)=>const BloodPressureScreen(),
            ADDBloodPressureScreen.idADDBloodPressure :(context) => const ADDBloodPressureScreen(),
            GlucoseScreen.idGlucose :(context) => const GlucoseScreen(),
            ADDGlucoseScreen.idADDGlucose : (context)=>const ADDGlucoseScreen(),
            SurgeryScreen.idSurgery :(context) => const SurgeryScreen(),
            AddLabTestScreen.idAddLabTest :(context) =>  AddLabTestScreen(),
            AddRadiologyScreen.idAddRadiology :(context)=> const AddRadiologyScreen(),

//
            DrMedicalVisit.idDrMedicalVisit :(context) =>const DrMedicalVisit(),
            AddMedicalVisits.idAddMedicalVisit :(context)=>  AddMedicalVisits(),
            DoctorSurgeryScreen.idDoctorSurgery :(context)=>  const DoctorSurgeryScreen(),
            AddSurgeryScreen.idAddSurgery : (context)=> const AddSurgeryScreen(),

            VerifyOtp.idOVerifyOtp: (context)=> const VerifyOtp(),


          }),
    );
  }
}
