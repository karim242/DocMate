import 'package:bloc/bloc.dart';
import 'package:docmate/Blocs/doctor_register/doctorRegisterStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorRegisterCubit extends Cubit<DoctorRegisterStates>{
  DoctorRegisterCubit() : super(InitDoctorRegisterStates());
  static DoctorRegisterCubit get(context){
    return BlocProvider.of(context);
  }
   var DNamecontroller= TextEditingController();
  var Idcontroller= TextEditingController();
  var Specializationcontroller= TextEditingController();
  var Dphonecontroller= TextEditingController();
   var clinicadresscontroller= TextEditingController();

  var Demailregistercontroller= TextEditingController();
  var Dpasswordregistercontroller= TextEditingController();
  var Dpasswordconfirmcontroller= TextEditingController();


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

}
