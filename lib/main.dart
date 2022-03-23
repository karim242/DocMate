import 'package:docmate/doctor%20route/signUpDoctor.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen1.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen2.dart';
import 'package:docmate/selectUser/selectUser.dart';
import 'package:docmate/selectUser/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Blocs/cubit/cubit.dart';
import 'Blocs/login/login_cubit.dart';
import 'Blocs/register/register_cubit.dart';

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
          return RegisterCubit();
        }),
        BlocProvider(create: (context) {
          return UserCubit();
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
            SignUpScreen1.id1: (context) => const SignUpScreen1(),
            SignUpScreen2.id2: (context) => const SignUpScreen2(),
            SignUpScreenDoctor.id: (context) => SignUpScreenDoctor(),
          }),
    );
  }
}
