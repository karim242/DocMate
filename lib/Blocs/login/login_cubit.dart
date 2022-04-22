import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context)=>BlocProvider.of(context);
  List<dynamic> response=[];

  var emailcontroller= TextEditingController();
  var passwordController= TextEditingController();
  var idController= TextEditingController();


  void patientLogin()
  {
    emit(LoadingLoginStates());

     DioHelperAPI.postData(
        url: "login",
        data: {
          "email": emailcontroller.text,
          "password": passwordController.text,
        }
    ).then((value) {
     response= value.data;
     print(response);
      emit(LoginSuccessStates());
    }
    ).catchError((error)
    {

      print("Error is ==> $error".toString());
      emit(LoginErrorStates());
    });
  }



  //for change password
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();


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