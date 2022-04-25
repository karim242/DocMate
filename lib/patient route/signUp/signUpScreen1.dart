import 'package:docmate/patient%20route/signUp/signUpScreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Blocs/register/register_cubit.dart';
import '../../Blocs/register/register_states.dart';
import '../../constant.dart';

class SignUpPatientScreen extends StatelessWidget {
  const SignUpPatientScreen({Key? key}) : super(key: key);
  static String id1="SignUpScreen1";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPatientCubit, RegisterStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = RegisterPatientCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: blueColor,
            ),
            backgroundColor: blueColor,
            body: Form(
              key: cubit.formkey1,
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
                      flex: 5,
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
                            mainAxisSize: MainAxisSize.min,
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
                                      width: MediaQuery.of(context).size.width / 10),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: blueColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ), //Sign Up
                                ]),
                              ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      indicatorOn()
                                    ],
                                  ),
                              SizedBox(height: MediaQuery.of(context).size.height / 55,),
                              textFieldForm(
                                secure:false,
                                text: 'Name',
                                ontap: () {},
                                controller: cubit.nameController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                           SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: false,
                                text: 'E-mail',
                                ontap: () {},
                                controller: cubit.emailRegisterController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: true,
                                text: 'Password',
                                ontap: () {},
                                controller: cubit.passwordRegisterController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: true,
                                text: 'Confirm Password',
                                ontap: () {},
                                controller: cubit.passwordconfirmcontroller,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: false,
                                text: 'Phone number',
                                ontap: () {},
                                controller: cubit.phoneController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height / 20,
                                  top: MediaQuery.of(context).size.height / 100,
                                ),
                                child: defaultBottonTologin(
                                    text: "Next",
                                    Backgroundcolur: blueColor,
                                    textColor: whiteColor,
                                    height: MediaQuery.of(context).size.height / 14,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    onpressed: () {
                                      if (cubit.formkey1.currentState!.validate())
                                      {
                                        if(cubit.passwordRegisterController.value==cubit.passwordconfirmcontroller.value)
                                          {

                                            Navigator.pushNamed(context,SignUpPatientScreen2.id2);
                                          }
                                        else
                                          {}
                                      }
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
