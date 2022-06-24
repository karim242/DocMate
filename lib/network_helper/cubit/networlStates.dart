
import 'package:docmate/models/searchModel.dart';

import '../../models/RequestOtp.dart';

class NetworkStates {}
class NetworkInitStates extends NetworkStates{}
class NetworkLoadingStates extends NetworkStates{}
class NetworkSuccessStates extends NetworkStates{}
class NetworkErrorStates extends NetworkStates{}
class ChangeBottomNavState extends NetworkStates{}
class LoadingValueStates extends NetworkStates{}
class LoadingDoctorPatientStates extends NetworkStates{}
class LoadingSearchValueStates extends NetworkStates{}
class SearchSuccessStates extends NetworkStates{
  // final FindPatientModel findPatientModel;
  //
  // SearchSuccessStates(this.findPatientModel);
}
class OtpReqSuccessStates extends NetworkStates{
   final RequestOtpModel requestOtpModel;

   OtpReqSuccessStates(this.requestOtpModel);
}
class OtpReqErrorStates extends NetworkStates{
  final RequestOtpModel errorRequestOtpModel;

  OtpReqErrorStates(this.errorRequestOtpModel);
}
class OtpVerifySuccessStates extends NetworkStates{
  final VerifyOtpModel verifyOtpModel;

  OtpVerifySuccessStates(this.verifyOtpModel);
}
class SearchErrorStates extends NetworkStates{
  final String error;

  SearchErrorStates(this.error);
}
class ClearSearchStates extends NetworkStates{}

class LoadingPatientProfileStates extends NetworkStates{}
class PatientProfileSuccessStates extends NetworkStates{}
class PatientProfileErrorStates extends NetworkStates{}


class LoadingDoctorProfileStates extends NetworkStates{}
class PatientDoctorSuccessStates extends NetworkStates{}
class PatientDoctorErrorStates extends NetworkStates{}

class EditSuccessStates extends NetworkStates{}
class EditErrorStates extends NetworkStates{
  final String error;

  EditErrorStates(this.error);
}