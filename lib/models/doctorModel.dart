class DoctorRegisterModel
{
  late String message;
  DoctorRegisterModel.fromJson(Map<String,dynamic>json)
  {
    message = json["message"];
  }
}
class DoctorLoginModel
{
  late bool status;
  late String message;
  late String token;
  DoctorLoginModel.fromJson(Map<String,dynamic>json)
  {
    status = json["status"];
    message = json["message"];
    token = json["token"];
  }
}