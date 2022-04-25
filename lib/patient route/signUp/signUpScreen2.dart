
import 'package:docmate/patient%20route/signUp/confirm4digitScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Blocs/register/register_cubit.dart';
import '../../Blocs/register/register_states.dart';
import '../../constant.dart';
import '../../network_helper/cachehelper/cacheHelper.dart';
import '../../shared/sharedComponent.dart';
import '../homePage/selectPage.dart';

class SignUpPatientScreen2 extends StatelessWidget {
  const SignUpPatientScreen2({Key? key}) : super(key: key);
  static String id2="SignUpScreen2";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPatientCubit, RegisterStates>(
        listener: (context, states) {
          if(states is RegisterSuccessStates)
          {
              print(states.registerModel.message);
              showToast(
                  msg: states.registerModel.message,
                  states: ToastStates.SUCCESS
              );
              navigateAndFinish(context,const SelectPage(),);
            }
          if(states is RegisterErrorStates)
            {
              showToast(
                  msg: "The password must be at least 6 characters.",
                  states: ToastStates.ERROR
              );

            }


        },
        builder: (context, states) {
          var cubit = RegisterPatientCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: blueColor,
            ),
            backgroundColor: blueColor,
            body: Form(
              key: cubit.formkey2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: logoImage(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Expanded(
                      flex: 6,
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(84.0),
                                topRight: Radius.circular(84.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 6,
                                  top: MediaQuery.of(context).size.height / 60,
                                  right: MediaQuery.of(context).size.width / 6,
                                ),
                                child: Row(children: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        color: blueColor,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ), //Log In
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width / 8),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: blueColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ), //Sign Up
                                ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  indicatorOff(),
                                  SizedBox(width: MediaQuery.of(context).size.width/20,),
                                  indicatorOn(),

                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 55,),
                              textFieldForm(
                                secure:false,
                                text: 'Height',
                                ontap: () {},
                                controller: cubit.heightController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: false,
                                text: 'Weight',
                                ontap: () {},
                                controller: cubit.weightController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: false,
                                text: 'Blood type',
                                ontap: () {},
                                controller: cubit.bloodTypeController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: false,
                                text: 'Date of birth',
                                ontap: () {},
                                controller: cubit.dateOfBirthController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: false,
                                text: 'Address',
                                ontap: () {},
                                controller: cubit.addressController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height / 20,
                                  top: MediaQuery.of(context).size.height / 100,
                                ),
                                child: defaultBottonTologin(
                                  text: "Sing Up",
                                  Backgroundcolur: blueColor,
                                  textColor: whiteColor,
                                  height: MediaQuery.of(context).size.height / 14,
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  onpressed: () {
                                    cubit.patientRegister();
                                   // Navigator.pushNamed(context, HomePageScreen.homePageID);
                                  },
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
