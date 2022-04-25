import 'package:docmate/Blocs/register/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/patientModel.dart';
import '../../network_helper/dioHelper.dart';

class RegisterPatientCubit extends Cubit<RegisterStates>{
  RegisterPatientCubit() : super(InitRegisterStates());
  static RegisterPatientCubit get(context){
    return BlocProvider.of(context);
  }
  var nameController= TextEditingController();
  var emailRegisterController= TextEditingController();
  var passwordRegisterController= TextEditingController();
  var passwordconfirmcontroller= TextEditingController();
  var phoneController= TextEditingController();
  var heightController= TextEditingController();
  var weightController= TextEditingController();
  var bloodTypeController= TextEditingController();
  var dateOfBirthController= TextEditingController();
  var addressController= TextEditingController();


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

  late PatientRegisterModel patientRegisterModel;
  void patientRegister()
  {
    emit(LoadingRegisterStates());

    DioHelperAPI.postData(
        url: "patient/register",
        data: {
          "name":nameController.text.toString(),
          "email":emailRegisterController.text.toString(),
          "date":dateOfBirthController.text.toString(),
          "phone":phoneController.text.toString(),
          "blood_type":bloodTypeController.text.toString(),
          "height":heightController.text.toString(),
          "weight":weightController.text.toString(),
          "password":passwordRegisterController.text.toString(),
        }
    ).then((value) {
      patientRegisterModel=PatientRegisterModel.fromJson(value.data);

      print(patientRegisterModel.message);
      emit(RegisterSuccessStates(patientRegisterModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(RegisterErrorStates());
    });
  }
  
  
  
  
  }
