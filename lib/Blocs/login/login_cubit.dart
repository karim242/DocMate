import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context)=>BlocProvider.of(context);

  void patientLogin()
  {
    DioHelperAPI.postData(
        url: "login",
        data: {
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
        }
    ).then((value) {
      print(value.data);
      emit(LoginSuccessStates());
    }).catchError((error)
    {
      print("Error is ==> $error");
      emit(LoginErrorStates());
    });
  }

  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var idController= TextEditingController();

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