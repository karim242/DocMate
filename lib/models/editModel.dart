import 'dart:io';

class EditDocModel
{
  late EditDocData data;
  EditDocModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? EditDocData.fromJson(json['data']) : null)!;
  }
}
class EditDocData {
  late int id;
  late String name;
  late String email;
  late String department;

  late File photo;
////still image


  EditDocData.fromJson(Map<String, dynamic>json)
  {
    id = json["union_id"];
    name = json["name"];
    email = json["email"];
    department = json["department"];
    photo= json["photo"];
  }
}