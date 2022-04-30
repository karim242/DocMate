import 'package:docmate/Blocs/featureBloc/featurecubit.dart';
import 'package:docmate/Blocs/login/login_cubit.dart';
import 'package:docmate/Blocs/login/login_states.dart';
import 'package:docmate/patient%20route/loginScreen.dart';
import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Blocs/featureBloc/featureStates.dart';
import '../constant.dart';
import '../doctor route/login/doctorLogin.dart';
import '../patient route/loginScreen.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);
  static String id = 'SelectUser';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = FeatureCubit.get(context);
        return Scaffold(
            backgroundColor: blueColor,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoImage(),
                  SizedBox(height: MediaQuery
                      .of(context).size.height / 20),
                  defaultBottonTologin(
                      height: MediaQuery
                          .of(context).size.height / 14,
                      width: MediaQuery
                          .of(context).size.width / 1.4,
                      text: "Doctor",
                      Backgroundcolur: whiteColor,
                      textColor: blueColor,
                      onpressed: () {
                        //cubit.changeDoctor();
                        navigateTo(context, const DoctorLoginScreen());
                      }
                  ),
                  const SizedBox(height: 24.0),
                  defaultBottonTologin(
                      height: MediaQuery
                          .of(context).size.height / 14,
                      width: MediaQuery
                          .of(context).size.width / 1.4,
                      text: "Patient",
                      Backgroundcolur: whiteColor,
                      textColor: blueColor,
                      onpressed: () {
                      //cubit.changePatient();
                          navigateTo(context,const PatientLoginScreen());

                      }
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
