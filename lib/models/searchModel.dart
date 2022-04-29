class SearchModel
{
  late SearchData data;
  SearchModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? SearchData.fromJson(json['data']) : null)!;

  }
}
class SearchData {
  late String id;
  late String name;
  late String email;
  late String date;
  late int    phone;
  late String address;
  late String bloodType;
  late double weight;
  late double height;
  late String image;

  SearchData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    date= json["date"];
    phone=  json["phone"];
    address= json["address"];
    bloodType=  json["blood_type"];
    weight= json["weight"];
    height=  json["height"];
    image= json["image"];
  }
}