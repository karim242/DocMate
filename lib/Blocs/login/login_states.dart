import 'package:docmate/models/patientLogin.dart';

abstract class LoginStates{}
class InitLoginStates extends LoginStates{}
class LoadingLoginStates extends LoginStates{}
class LoginSuccessStates extends LoginStates{
  final PatientLoginModel loginModel;

  LoginSuccessStates(this.loginModel);

}
class LoginErrorStates extends LoginStates{}
class ChangePatient extends LoginStates{}
class ChangeDoctor extends LoginStates{}