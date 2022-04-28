
import '../../models/doctorModel.dart';

abstract class DoctorRegisterStates{}
class InitDoctorRegisterStates extends DoctorRegisterStates{}
class LoadingRegisterStates extends DoctorRegisterStates{}
class RegisterSuccessStates extends DoctorRegisterStates{
  final DoctorRegisterModel registerModel;
  RegisterSuccessStates(this.registerModel);
}

class RegisterErrorStates extends DoctorRegisterStates{}

class ChangeToPatient extends DoctorRegisterStates{}
class ChangeToDoctor extends DoctorRegisterStates{}