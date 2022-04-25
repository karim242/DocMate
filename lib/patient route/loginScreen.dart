import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/network_helper/cachehelper/cacheHelper.dart';
import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/signUp/signUpScreen1.dart';
import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/material.dart';
import 'package:docmate/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Blocs/login/login_cubit.dart';
import '../Blocs/login/login_states.dart';
import '../doctor route/doctorHomePage/selectdoctorpage.dart';
import '../doctor route/signUpDoctor1.dart';
import 'homePage/selectPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
LoginScreen({required this.value});
final String value;
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, states) {
          if(states is LoginSuccessStates)
            {
              if(states.loginModel.status)
                {
                  print(states.loginModel.message);
                  CacheHelper.saveData(key: "token", value: states.loginModel.token,
                  ).then((value)
                  =>navigateAndFinish(context,
                      const SelectPage(),
                  ),
                  );
                   showToast(
                   msg: states.loginModel.message,
                   states: ToastStates.SUCCESS
               );
                }else
                {
                  print(states.loginModel.message);
                  showToast(
                      msg: states.loginModel.message,
                      states: ToastStates.ERROR
                  );
                }
            }
          if(states is LoginErrorStates)
            {
              showToast(
                  msg: "Login credentials are invalid",
                  states: ToastStates.ERROR,
              );
            }
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
                  flex: 3,
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
                                  if(cubit.isuser) {
                                    Navigator.pushNamed(
                                        context, SignUpScreenDoctor1.doctorId1);
                                  }
                                 else
                                    {
                                      Navigator.pushNamed(
                                          context,SignUpPatientScreen.id1);
                                    }
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
                            text: value,
                            ontap: () {},
                            controller:cubit.emailcontroller,
                          //     value=="email"
                          // ? cubit.emailcontroller
                          //     : cubit.idController,
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
                            controller: cubit.passwordController,
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
                                condition: states is! LoadingLoginStates,
                                builder: (context) =>defaultBottonTologin(
                                    text: "Log In",
                                    Backgroundcolur: blueColor,
                                    textColor: whiteColor,
                                    height: MediaQuery.of(context).size.height / 14,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    onpressed: () {
                                      if (cubit.formkey.currentState!.validate())
                                        {
                                          cubit.patientLogin();
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
                                          print(cubit.emailcontroller.text);
                                          print(cubit.passwordController.text);
                                      }
                                      else {print("Errorrrrrrrrr");}
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
