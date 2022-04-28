import 'package:bloc/bloc.dart';
import 'package:docmate/Blocs/doctor_register/doctorRegisterStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../models/doctorModel.dart';
import '../../network_helper/dioHelper.dart';

class DoctorRegisterCubit extends Cubit<DoctorRegisterStates>{
  DoctorRegisterCubit() : super(InitDoctorRegisterStates());
  static DoctorRegisterCubit get(context){
    return BlocProvider.of(context);
  }
   var doctorNameController= TextEditingController();
  var doctorIdController= TextEditingController();
  var specializationController= TextEditingController();
  var doctorPhoneController= TextEditingController();
   var clinicAddressController= TextEditingController();

  var doctorEmailRegisterController= TextEditingController();
  var doctorPasswordRegisterController= TextEditingController();
  var doctorPasswordConfirmController= TextEditingController();


   var doctorformkey1  =GlobalKey<FormState>();
  var doctorformkey2  =GlobalKey<FormState>();

  //
   bool isuser= true;
  void changedoctor(){
    isuser =true;
     emit(ChangeToDoctor());
   }
  void changepatient(){
    isuser =false;
    emit(ChangeToPatient());
  }


  late DoctorRegisterModel doctorRegisterModel;
  void doctorRegister()
  {
    emit(LoadingRegisterStates());

    DioHelperAPI.postData(
        url: "doctor/register",
        token: token,
        data: {
          "name":doctorNameController.text,
          "email":doctorEmailRegisterController.text,
          "password":doctorPasswordRegisterController.text,
          "phone":doctorPhoneController.text,
          "department":specializationController
          //"union_id":weightController.text,

        }
    ).then((value) {
      doctorRegisterModel=DoctorRegisterModel.fromJson(value.data);

      print(doctorRegisterModel.message);
      emit(RegisterSuccessStates(doctorRegisterModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error".toString());
      emit(RegisterErrorStates());
    });
  }



}
