import 'package:docmate/models/doctorModel.dart';
import 'package:docmate/models/patientModel.dart';

abstract class LoginStates{}
class InitLoginStates extends LoginStates{}
class LoadingLoginStates extends LoginStates{}
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
class ChangePatient extends LoginStates{}
class ChangeDoctor extends LoginStates{}