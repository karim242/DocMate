import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/doctor%20route/doctorHomePage/selectdoctorpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Blocs/login/login_cubit.dart';
import '../../Blocs/login/login_states.dart';
import '../../constant.dart';
import '../../network_helper/cachehelper/cacheHelper.dart';
import '../../patient route/homePage/selectPage.dart';
import '../../shared/sharedComponent.dart';
import '../signUp/signUpDoctor1.dart';

class DoctorLoginScreen extends StatelessWidget {
  const DoctorLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {
        if(states is DoctorLoginSuccessStates)
        {
          if(states.loginModel.status)
          {
            print(states.loginModel.message);
            CacheHelper.saveData(key: "token", value: states.loginModel.token,
            ).then((value)
            =>navigateAndFinish(context,
              const DoctorSelectPage(),
            ),
            );
            showToast(
                msg: states.loginModel.message,
                states: ToastStates.SUCCESS
            );

          }
          else
          {
            print(states.loginModel.message);
            showToast(
                msg: states.loginModel.message,
                states: ToastStates.ERROR
            );
          }
        }
        // else
        // {
        //   showToast(
        //     msg: "Login credentials are invalid",
        //     states: ToastStates.ERROR,
        //   );
        // }
      },
      builder: (context, states) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: blueColor,
          ),
          backgroundColor: blueColor,
          body: Form(
            key: cubit.formkey,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: logoImage(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(84.0),
                        topRight: Radius.circular(84.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 6,
                            top: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 25,
                            right: MediaQuery.of(context).size.width / 6,
                          ),
                          child: Row(children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: blueColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ), //Log In
                            SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 10),
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, const SignUpScreenDoctor1(),);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: blueColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ), //Sign Up
                          ]),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        textFieldForm(
                          secure: false,
                          text: "id",
                          ontap: () {},
                          controller:cubit.idController,

                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 1.16,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        textFieldForm(
                          secure: true,
                          text: 'Password',
                          ontap: () {},
                          controller: cubit.doctorPasswordController,
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 1.16,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 1.8,
                            bottom: 0.0,
                            top: 0.0,
                          ),
                          child: MaterialButton(
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 5,
                            top: MediaQuery.of(context).size.height / 200,
                          ),
                          child: ConditionalBuilder(
                              condition: states is! LoadingDoctorLoginStates,
                              builder: (context) =>defaultBottonTologin(
                                  text: "Log In",
                                  Backgroundcolur: blueColor,
                                  textColor: whiteColor,
                                  height: MediaQuery.of(context).size.height / 14,
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  onpressed: () {
                                    if (cubit.formkey.currentState!.validate())
                                    {
                                      //cubit.patientLogin();
                                      //   if(cubit.isuser)
                                      //   {
                                      //
                                      //     Navigator.pushReplacement(
                                      //       context,
                                      //      MaterialPageRoute(builder: (context) {
                                      //   return const DoctorSelectPage();
                                      // },),);
                                      //   }
                                      //   else{
                                      //
                                      //     Navigator.pushReplacement(
                                      //       context,
                                      //       MaterialPageRoute(builder: (context) {
                                      //         return const SelectPage();
                                      //       },),);
                                      //
                                      //   }
                                      // print(cubit.idController.text);
                                      cubit.doctorLogin();

                                      print(cubit.idController.text);
                                      print(cubit.doctorPasswordController.text);
                                      cubit.doctorPasswordController.clear();
                                    }
                                    else {print("Error");}
                                  }),
                              fallback: (context)=>const Center(
                                child: CircularProgressIndicator(),
                              )
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
      },
    );
  }
}