import 'package:docmate/Blocs/cubit/states.dart';
import 'package:docmate/Blocs/register/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(InitRegisterStates());
  static RegisterCubit get(context){
    return BlocProvider.of(context);
  }
  var Namecontroller= TextEditingController();
  var emailregistercontroller= TextEditingController();
  var passwordregistercontroller= TextEditingController();
  var passwordconfirmcontroller= TextEditingController();
  var locationcontroller= TextEditingController();
  var heightcontroller= TextEditingController();
  var weightcontroller= TextEditingController();
  var bloodTypecontroller= TextEditingController();
  var dateOfBirthcontroller= TextEditingController();


  var formkey1  =GlobalKey<FormState>();
  var formkey2  =GlobalKey<FormState>();

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