import 'dart:core';

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
class PatientRegisterModel
{
  late String message;
  PatientRegisterModel.fromJson(Map<String,dynamic>json)
  {
    message = json["message"];
  }
}


class PatientChangePasswordModel
{
  late String success;
  PatientChangePasswordModel.fromJson(Map<String,dynamic>json)
  {
    success = json["success"];
  }
}
//
// class PatientProfileModel {
//   late PatientProfileData data;
//
//   PatientProfileModel.fromJson(Map<String, dynamic>json)
//   {
//     data =
//     (json['data'] != null ? PatientProfileData.fromJson(json['data']) : null)!;
//   }
// }
// class PatientProfileData {
//             late int id;
//          late String name;
//          late String email;
//          late String date;
//          late String phone;
//          late String address;
//          late String bloodType;
//             late int weight;
//             late int height ;
//
//
//   // "id": 384,
//   // "name": "amr",
//   // "email": "karim8@gmail.com",
//   // "date": "2022-02-01",
//   // "phone": 123456789,
//   // "address": null,
//   // "blood_type": "a",
//   // "weight": 80,
//   // "height": 180,
//   // "image": "https://i.ibb.co/n7yGWqz/mm.png"
//   PatientProfileData.fromJson(Map<String, dynamic>json)
//   {
//     id = json["id"];
//     name=json["name"];
//     email=json["email"];
//     date=json["date"];
//     phone=json["phone"];
//     address=json["address"];
//     bloodType=json["blood_type"];
//     weight=json["weight"];
//     height =json["height"];
//   }
// }