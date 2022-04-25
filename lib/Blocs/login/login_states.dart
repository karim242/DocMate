import 'package:docmate/models/patientModel.dart';

abstract class LoginStates{}
class InitLoginStates extends LoginStates{}
class LoadingLoginStates extends LoginStates{}
class LoginSuccessStates extends LoginStates{
  final PatientLoginModel loginModel;

  LoginSuccessStates(this.loginModel);

}
class LoginErrorStates extends LoginStates{
  final String error;

  LoginErrorStates(this.error);
}
class ChangePatient extends LoginStates{}
class ChangeDoctor extends LoginStates{}