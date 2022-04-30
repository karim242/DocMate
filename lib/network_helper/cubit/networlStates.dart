
import 'package:docmate/models/searchModel.dart';

import '../../models/RequestOtp.dart';

class NetworkStates {}
class NetworkInitStates extends NetworkStates{}
class NetworkLoadingStates extends NetworkStates{}
class NetworkSuccessStates extends NetworkStates{}
class NetworkErrorStates extends NetworkStates{}
class ChangeBottomNavState extends NetworkStates{}
class LoadingValueStates extends NetworkStates{}
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
class OtpVerifySuccessStates extends NetworkStates{
  final VerifyOtpModel verifyOtpModel;

  OtpVerifySuccessStates(this.verifyOtpModel);
}
class SearchErrorStates extends NetworkStates{
  final String error;

  SearchErrorStates(this.error);
}
class ClearSearchStates extends NetworkStates{}

