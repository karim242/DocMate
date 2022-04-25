import '../../models/patientModel.dart';

abstract class RegisterStates{}
class InitRegisterStates extends RegisterStates{}
class LoadingRegisterStates extends RegisterStates{}
class RegisterSuccessStates extends RegisterStates{
 final PatientRegisterModel registerModel;
 RegisterSuccessStates(this.registerModel);
  }

class RegisterErrorStates extends RegisterStates{}
class ChangeIsPatient extends RegisterStates{}
class ChangeIsDoctor extends RegisterStates{}