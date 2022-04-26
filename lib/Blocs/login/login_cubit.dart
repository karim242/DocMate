import 'package:docmate/constant.dart';
import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/patientModel.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context)=>BlocProvider.of(context);
  List<dynamic> response=[];

  var emailcontroller= TextEditingController();
  var passwordController= TextEditingController();
  var idController= TextEditingController();

/////////////////////
 late PatientLoginModel patientLoginModel;
  void patientLogin()
  {
    emit(LoadingLoginStates());

     DioHelperAPI.postData(
        url: "patient/login",

        data: {
          "email": emailcontroller.text,
          "password": "${passwordController.text}",
        }
    ).then((value) {
       patientLoginModel=PatientLoginModel.fromJson(value.data);
       print(patientLoginModel.status);
       print(patientLoginModel.message);
       print(token);
       print(patientLoginModel.token);
       emit(LoginSuccessStates(patientLoginModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(LoginErrorStates(error));
    });
  }




  //for change password
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  ///
  var formkey  =GlobalKey<FormState>();
  bool isuser= true;

  void changedoctor(){
    isuser =true;
    emit(ChangeDoctor());
  }
  void changepatient(){
    isuser =false;
    emit(ChangePatient());
  }

}