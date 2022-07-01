import 'package:docmate/models/doctorModel.dart';
import 'package:docmate/models/patientModel.dart';

import '../../models/patientModel.dart';


abstract class LoginStates{}
class InitLoginStates extends LoginStates{}
class LoadingPatientLoginStates extends LoginStates{}
class LoadingDoctorLoginStates extends LoginStates{}
class PatientLoginSuccessStates extends LoginStates{
final PatientLoginModel loginModel;

 PatientLoginSuccessStates(this.loginModel);

}
class DoctorLoginSuccessStates extends LoginStates{
  final DoctorLoginModel loginModel;

  DoctorLoginSuccessStates(this.loginModel);

}

class LoginErrorStates extends LoginStates{
  final String error;

  LoginErrorStates(this.error);
}
class ChangePatientPassword extends LoginStates{
  final PatientChangePasswordModel patientPasswordModel;

  ChangePatientPassword( this.patientPasswordModel);
}

class ChangeDoctorPassword extends LoginStates{
  final DoctorChangePasswordModel doctorPasswordModel;

  ChangeDoctorPassword( this.doctorPasswordModel);
}
class LoadingDoctorPatientStates extends LoginStates{}
class SuccessDoctorPatientStates extends LoginStates{}
class ErrorDoctorPatientStates extends LoginStates{}