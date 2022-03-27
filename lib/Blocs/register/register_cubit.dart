import 'package:docmate/Blocs/register/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network_helper/dioHelper.dart';

class RegisterPatientCubit extends Cubit<RegisterStates>{
  RegisterPatientCubit() : super(InitRegisterStates());
  static RegisterPatientCubit get(context){
    return BlocProvider.of(context);
  }
  var Namecontroller= TextEditingController();
  var emailregistercontroller= TextEditingController();
  var passwordregistercontroller= TextEditingController();
  var passwordconfirmcontroller= TextEditingController();
  var phonecontroller= TextEditingController();
  var heightcontroller= TextEditingController();
  var weightcontroller= TextEditingController();
  var bloodTypecontroller= TextEditingController();
  var dateOfBirthcontroller= TextEditingController();
  var adresscontroller= TextEditingController();


  var Confirm4Digitcontroller= TextEditingController();


  var formkey1  =GlobalKey<FormState>();
  var formkey2  =GlobalKey<FormState>();
  var formkey3  =GlobalKey<FormState>();

  bool isuser= true;
  void changedoctor(){
    isuser =true;
    emit(ChangeIsDoctor());
  }
  void changepatient(){
    isuser =false;
    emit(ChangeIsPatient());
  }


  
  
  
  
  }
