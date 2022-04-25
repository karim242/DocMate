class PatientLoginModel
{
  late bool status;
  late String message;
  late String token;
  PatientLoginModel.fromJson(Map<String,dynamic>json)
  {
    status = json["status"];
    message = json["message"];
    token = json["token"]??null;
  }
}