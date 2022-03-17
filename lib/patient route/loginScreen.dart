import 'package:flutter/material.dart';
import 'package:docmate/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'LogInScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blueColor,
      ),
      backgroundColor: blueColor,
      body: Form(
      key:formKey,
      child:ListView(
          children: [
            logoImage(),
            const SizedBox(
              height: 70.0,
            ),
            Flexible(
              flex:1,
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70.0),
                      topRight: Radius.circular(70.0)),
                ),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 90.0,
                          top: 22.0,
                          bottom: 74.0,
                          right: 90.0,
                        ),
                        child: Row(children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                const LoginScreen();
                              });
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 20.0,
                              ),
                            ),
                          ), //Log In
                          const SizedBox(
                            width: 69.0,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SelectUser()),
                                // );
                              });
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 20.0,
                              ),
                            ),
                          ),//Sign Up
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      textFieldForm(
                          text: 'E-mail',
                          ontap: () {},
                          controller: emailController),
                      const SizedBox(
                        height: 24,
                      ),
                      textFieldForm(
                          text: 'Password',
                          ontap: () {},
                          controller: passwordController),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 214,
                            right: 39,
                            top: 4,
                          ),
                        ),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                              // fontFamily: 'MPLUSRounded1c',
                              // fontWeight: MPLUSRounded1c-Regular,
                              ),
                        ),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 208,top: 38,),
                        child: defaultBottonTologin(
                            text: "Log In",
                            Backgroundcolur: blueColor,
                            textColor: whiteColor,
                            onpressed: () {
                              if(formKey.currentState!.validate()) {
                                setState(() {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => SelectUser()));
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      ),
    );
  }
}
