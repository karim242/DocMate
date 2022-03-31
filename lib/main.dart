import 'package:docmate/Blocs/doctor_register/doctorRegisterCubit.dart';
import 'package:docmate/doctor%20route/signUpDoctor1.dart';
import 'package:docmate/network_helper/cubit/networkCubit.dart';
import 'package:docmate/network_helper/dioHelper.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/allergies.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/family_histoty.dart';
import 'package:docmate/patient%20route/homePage/features/medicalHistory/medicalHistory.dart';
import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/homePage/profilePage.dart';
import 'package:docmate/patient%20route/homePage/seeAll/latestNews.dart';
import 'package:docmate/patient%20route/homePage/seeAll/medicalAdvices.dart';
import 'package:docmate/patient%20route/homePage/medicalProfile.dart';
import 'package:docmate/patient%20route/signUp/confirm4digitScreen.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen1.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen2.dart';
import 'package:docmate/selectUser/selectUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Blocs/cubit/cubit.dart';
import 'Blocs/login/login_cubit.dart';
import 'Blocs/register/register_cubit.dart';
import 'doctor route/signUpDoctor2.dart';

void main() {
  runApp(const MyApp());

  DioHelper.init();
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
          home: HomePageScreen(),
          routes: {
            SelectUser.id: (context) => const SelectUser(),
            SignUpPatientScreen.id1: (context) => const SignUpPatientScreen(),
            SignUpPatientScreen2.id2: (context) => const SignUpPatientScreen2(),
            SignUpScreenDoctor1.doctorId1: (context) => const SignUpScreenDoctor1(),
            SignUpScreenDoctor2.doctorId2: (context) => const SignUpScreenDoctor2(),
            ConfirmScreen.id: (context) => const ConfirmScreen(),
            HomePageScreen.homePageID : (context) =>  HomePageScreen(),
            LatestNews.latestNewsID : (context) =>  const LatestNews(),
            MedicalAdvices.medicalAdvicesId : (context) =>  const MedicalAdvices(),
            MedicalProfileScreen.medicalProfileID : (context) => const MedicalProfileScreen(),
            PatientProfileScreen.profileID: (context)=> const PatientProfileScreen(),
            MedicalHistoryScreen.idMedicalHistory : (context)=> const MedicalHistoryScreen(),
            FamilyHistoryScreen.idFamilyHistory : (context)=> const FamilyHistoryScreen(),
            AllergyScreen.idAllergyScreen : (context)=> const AllergyScreen(),




          }),
    );
  }
}
