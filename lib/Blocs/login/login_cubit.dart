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
  var newPatientPassword = TextEditingController();
  var idController= TextEditingController();
  var doctorPasswordController= TextEditingController();
  var newDoctorPassword = TextEditingController();
  var confirmPassword = TextEditingController();


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
       //print(patientLoginModel.status);
       //print(patientLoginModel.message);
      print(token);
       print(patientLoginModel.token);
       token =patientLoginModel.token ;
       print(token);
       emit(PatientLoginSuccessStates(patientLoginModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(LoginErrorStates(error));
    });
  }

  late PatientChangePasswordModel passwordModel;
  void changePatientPassword()
  {
    emit(LoadingLoginStates());

    DioHelperAPI.postData(
        url: "patient/profile/change_password",
        token: token,
        data: {
          "oldpassword": patientPasswordController.text,
          "password": newPatientPassword.text,
        }
    ).then((value) {
      passwordModel=PatientChangePasswordModel.fromJson(value.data);

      print(passwordModel);

      emit(ChangePatientPassword(passwordModel));
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
      // print(token);
      // print(doctorLoginModel.token);
      token=doctorLoginModel.token ;
     // print(token);
      emit(DoctorLoginSuccessStates(doctorLoginModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(LoginErrorStates(error));
    });
  }



  late DoctorChangePasswordModel doctorPasswordModel;
  void changeDoctorPassword()
  {
    emit(LoadingLoginStates());

    DioHelperAPI.postData(
        url: "doctor/profile/change_password",
        token: token,
        data: {
          "oldpassword": patientPasswordController.text,
          "password": newDoctorPassword.text,
        }
    ).then((value) {
      doctorPasswordModel=DoctorChangePasswordModel.fromJson(value.data);

      print(doctorPasswordModel);

      emit(ChangeDoctorPassword(doctorPasswordModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(LoginErrorStates(error));
    });
  }

  // for Patient change password



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