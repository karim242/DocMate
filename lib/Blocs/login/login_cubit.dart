import 'package:docmate/constant.dart';
import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/doctorModel.dart';
import '../../models/patientModel.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context)=>BlocProvider.of(context);
  List<dynamic> response=[];

  var emailController= TextEditingController();
  var patientPasswordController= TextEditingController();
  var idController= TextEditingController();
  var doctorPasswordController= TextEditingController();

/////////////////////
 late PatientLoginModel patientLoginModel;
  void patientLogin()
  {
    emit(LoadingLoginStates());

     DioHelperAPI.postData(
        url: "patient/login",


        data: {
          "email": emailController.text,
          "password": "${patientPasswordController.text}",
        }
    ).then((value) {
       patientLoginModel=PatientLoginModel.fromJson(value.data);
       print(patientLoginModel.status);
       print(patientLoginModel.message);
       print(token);
       print(patientLoginModel.token);
       patientLoginModel.token =token;
       print(token);
       emit(PatientLoginSuccessStates(patientLoginModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(LoginErrorStates(error));
    });
  }


  late DoctorLoginModel doctorLoginModel;
  void doctorLogin()
  {
    emit(LoadingLoginStates());

    DioHelperAPI.postData(
        url: "doctor/login",


        data: {
          "email": idController.text,
          "password": doctorPasswordController.text,
        }
    ).then((value) {
      doctorLoginModel=DoctorLoginModel.fromJson(value.data);
      print(doctorLoginModel.status);
      print(doctorLoginModel.message);
      print(token);
      print(doctorLoginModel.token);
     // doctorLoginModel.token =token;
      print(token);
      emit(DoctorLoginSuccessStates(doctorLoginModel));
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