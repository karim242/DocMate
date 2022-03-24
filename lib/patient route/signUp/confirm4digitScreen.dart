import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Blocs/register/register_cubit.dart';
import '../../Blocs/register/register_states.dart';
import '../../constant.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);
  static String id="confirm4digit";

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
                key: cubit.formkey3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: logoImage(),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Expanded(
                        flex: 4,
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
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal:25.0 ),
                                    child: Text(
                                      "We sent a 4-digit code to your  phone number write it here",
                                      style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: blueColor,
                                      ) ,),
                                  ),
                                  SizedBox(
                                  height: MediaQuery.of(context).size.height / 15,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height / 12,
                                    width: MediaQuery.of(context).size.width / 1.3,

                                    child: TextFormField(
                                        // onTap: text == "date" ? ontap : () {},
                                       controller:cubit.Confirm4Digitcontroller ,
                                        validator: (value){
                                          if (value!.isEmpty)
                                          {
                                            return "  Must not be empty";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14.0),),
                                          fillColor: whiteColor,
                                          filled: true,
                                          errorStyle: const TextStyle(height: .8, color: Colors.red),
                                        ),
                                      ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height / 30,
                                  ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).size.height / 5,
                                        top: MediaQuery.of(context).size.height / 100,
                                      ),
                                      child:defaultBottonTologin(
                                        text: "Confirm",
                                        textColor: whiteColor,
                                        Backgroundcolur: blueColor,
                                        height: MediaQuery.of(context).size.height / 14,
                                        width: MediaQuery.of(context).size.width / 1.5,
                                      ),
                                    )
                            ],
                                )
                          ),
                          )
                    ,),
                ],),
          ),
          );
        });
  }
}
