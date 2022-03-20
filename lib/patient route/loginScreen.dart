import 'package:flutter/material.dart';
import 'package:docmate/constant.dart';
import 'package:flutter/rendering.dart';

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
        key: formKey,
        child: Column(
          children: [
          Expanded(flex: 1, child: logoImage(),),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(84.0),
                    topRight: Radius.circular(84.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width/6,
                        top:MediaQuery.of(context).size.height/60,
                        bottom: MediaQuery.of(context).size.height/25,
                        right: MediaQuery.of(context).size.width/6,
                      ),
                      child: Row(children: [
                        MaterialButton(
                          onPressed: () {},
                            child: Text(
                            "Log in",
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 20.0,
                            ),
                          ),
                        ), //Log In
                         SizedBox(
                          width: MediaQuery.of(context).size.width/10
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                            });
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
                      height: MediaQuery.of(context).size.height/20
                    ),
                    textFieldForm(
                        text: 'E-mail',
                        ontap: () {},
                        controller: emailController,
                      height: MediaQuery.of(context).size.height/14,
                      width: MediaQuery.of(context).size.width/1.16,
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height/30,
                    ),
                    textFieldForm(
                        text: 'Password',
                        ontap: () {},
                        controller: passwordController,
                      height: MediaQuery.of(context).size.height/14,
                      width: MediaQuery.of(context).size.width/1.16,

          ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width/1.8,
                        bottom: 0.0,top: 0.0,

                      ),
                      child: MaterialButton(

                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                              ),
                        ),
                        onPressed: () {},
                      ),
                     ),
                    Padding(
                      padding:  EdgeInsets.only(
                        bottom:MediaQuery.of(context).size.height/5,
                        top: MediaQuery.of(context).size.height/200,
                      ),
                      child: defaultBottonTologin(
                          text: "Log In",
                          Backgroundcolur: blueColor,
                          textColor: whiteColor,
                          height: MediaQuery.of(context).size.height/14,
                          width: MediaQuery.of(context).size.width/1.5,
                          onpressed: () {
                            if (formKey.currentState!.validate()) {
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
