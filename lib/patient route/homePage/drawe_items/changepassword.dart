import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'editprofile.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static String idChangePassword = "IdChangePassword";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          NetworkCubit cubit = NetworkCubit.get(context);

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Change Password',style: TextStyle(fontSize: 20,color: Colors.black),),
                centerTitle: true,
                backgroundColor: Colors.white,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text("Save" , style: TextStyle(color: Colors.black,fontSize: 18),),
                  ),
                ],

              ),
              body: Column(
                children: [
                  EditProfileTextField(label: 'current password',controller: cubit.currentPassword,),
                  EditProfileTextField(label: 'new password',controller: cubit.newPassword,validator: (value){
                    if (value.isEmpty) {
                      return "Please Re-Enter New Password";
                    } else {
                      return null;
                    }
                  },),
                  EditProfileTextField(label: 'confirm password',controller: cubit.confirmPassword,validator: (value){
                    if (value.isEmpty) {
                      return "Please Re-Enter New Password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    } else if (value != cubit.newPassword.value) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  },),
                ],
              ),
            ),
          );
        });
  }
}