import 'package:docmate/Blocs/doctor_register/doctorRegisterCubit.dart';
import 'package:docmate/Blocs/doctor_register/doctorRegisterStates.dart';
import 'package:docmate/doctor%20route/signUpDoctor1.dart';
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
import 'doctor route/signUpDoctor2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
          routes: {
            SelectUser.id: (context) => const SelectUser(),
            SignUpPatientScreen.id1: (context) => const SignUpPatientScreen(),
            SignUpPatientScreen2.id2: (context) => const SignUpPatientScreen2(),
            SignUpScreenDoctor1.doctorId1: (context) => SignUpScreenDoctor1(),
            SignUpScreenDoctor2.doctorId2: (context) => const SignUpScreenDoctor2(),
            ConfirmScreen.id: (context) => const ConfirmScreen(),


          }),
    );
  }
}
