import 'package:docmate/Blocs/login/login_cubit.dart';
import 'package:docmate/Blocs/login/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';
import 'editprofile.dart';

class ChangePatientsPassword extends StatelessWidget {
  const ChangePatientsPassword({Key? key}) : super(key: key);
  static String idPatChangePassword = "IdPaChangePassword";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, states) {
          if(states is ChangePatientPassword)
          {
            showToast(
                msg: states.patientPasswordModel.success,
                states: ToastStates.SUCCESS
            );
          }

        },
        builder: (context, states) {
          LoginCubit cubit = LoginCubit.get(context);

          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                title:  Text(
                  'Change Password',
                  style: text20ForNameAdd,
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      cubit.changePatientPassword();
                      Navigator.pop(context);

                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    EditProfileTextField(
                      secure: true,
                      label: 'current password',
                      controller: cubit.patientPasswordController,
                    ),
                    EditProfileTextField(
                      secure: true,
                      label: 'new password',
                      controller: cubit.newPatientPassword,
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return "Please Re-Enter New Password";
                        // } else {
                        //   return null;
                        // }
                      },
                    ),
                    EditProfileTextField(
                      secure: true,
                      label: 'confirm password',
                      controller: cubit.confirmPassword,
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return "Please Re-Enter New Password";
                        // } else if (value.length < 8) {
                        //   return "Password must be at least 8 characters long";
                        // } else if (value != cubit.newPatientPassword.value) {
                        //   return "Password must be same as above";
                        // } else {
                        //   return null;
                        //}
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
