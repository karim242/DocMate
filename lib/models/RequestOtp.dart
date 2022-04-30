class RequestOtpModel
{
  late int status;
  late String message;
  RequestOtpModel.fromJson(Map<String,dynamic>json)
  {
    status = json["status"];
    message = json["message"];
  }
}

class VerifyOtpModel
{
  late int status;
  late String message;
  VerifyOtpModel.fromJson(Map<String,dynamic>json)
  {
    status = json["status"];
    message = json["message"];
  }
}