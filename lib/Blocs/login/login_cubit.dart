import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginStates());
  static LoginCubit get(context){
    return BlocProvider.of(context);
  }

  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
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

  void patientLogin({
    required String email,
    required String password
})
{
  emit(LoadingLoginStates());
  DioHelperAPI.postData(
    url:'login',
    data: {
     'email':email,
     'password':password
    }
  ).then((value) {
    print(value.data);
    emit(LoginSuccessStates());
  }).catchError((error)
      {
        print(error);
        emit(LoginErrorStates());
      });

}

}