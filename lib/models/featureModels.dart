import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PressureModel
{
  late PressureData data;
  PressureModel.fromJson(Map<String,dynamic>json)
  {
  data = (json['data'] != null ? PressureData.fromJson(json['data']) : null)!;
  }
}
class PressureData {
  late int id;
  late String systolicPressure;
  late String diastolicPressure;
  late String date;

  PressureData.fromJson(Map<String,dynamic>json)
  {
    id = json["id"];
    systolicPressure = json["systolic_pressure"];
    diastolicPressure = json["diastolic_pressure"];
    //time =json["time"];
    date = json["date"];
  }
}

////for Allergy
////for patient
class AllergyPatientModel {
  late AllergyPatientData data;

  AllergyPatientModel.fromJson(Map<String, dynamic>json)
  {
    data =
    (json['data'] != null ? AllergyPatientData.fromJson(json['data']) : null)!;
  }
}
class AllergyPatientData {
late int id;
late String allergy;

AllergyPatientData.fromJson(Map<String, dynamic>json)
{
id = json["id"];
allergy = json["allergy"];
}
}



/////for Doctor
class AllergyDoctorData {
  late int id;
  late String allergy;
/////////////////////////////////
  AllergyDoctorData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    allergy = json["allergy"];
  }
}
class AllergyDoctorModel
{
  late AllergyDoctorData data;
  AllergyDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? AllergyDoctorData.fromJson(json['data']) : null)!;

  }
}


////for Family History
////fo
class FamilyHistoryModel
{
  late FamilyHistoryData data;
  FamilyHistoryModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? FamilyHistoryData.fromJson(json['data']) : null)!;

  }
}
class FamilyHistoryData {
  late int id;
  late String disease;
  late String relation;

  FamilyHistoryData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    disease = json["disease"];
    relation = json["realation"];
  }
}


////for glucose
class GlucoseModel
{
  late GlucoseData data;
  GlucoseModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? GlucoseData.fromJson(json['data']) : null)!;

  }
}
class GlucoseData {
  late int id;
  late String glucoseResult;
  late String glucoseType;
  late String date;

  GlucoseData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    glucoseResult = json["glucos_result"];
    glucoseType = json["glucos_type"];
    date = json["date"];
  }
}

////for vaccine
class VaccineModel
{
  late VaccineData data;
  VaccineModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? VaccineData.fromJson(json['data']) : null)!;
  }
}
class VaccineData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
////still image

  VaccineData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
  }
}

/////for radiology
class RadiologyModel
{
  late RadiologyData data;
  RadiologyModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? RadiologyData.fromJson(json['data']) : null)!;
  }
}
class RadiologyData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
////still image


  RadiologyData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
  }
}

////for labTest
class LabTestModel
{
  late LabTestData data;
  LabTestModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? LabTestData.fromJson(json['data']) : null)!;
  }
}
class LabTestData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
////still image


  LabTestData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
  }
}

////for Surgery
class SurgeryModel
{
  late SurgeryData data;
  SurgeryModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? SurgeryData.fromJson(json['data']) : null)!;
  }
}
class SurgeryData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
  late PickedFile image;
////still image


  SurgeryData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
    image= json["image"];
  }
}
// class SurgeryDoModel
// {
//   late SurgeryDoData data;
//   SurgeryDoModel.fromJson(Map<String,dynamic>json)
//   {
//     data = (json['data'] != null ? SurgeryDoData.fromJson(json['data']) : null)!;
//   }
// }
// class SurgeryDoData {
//   late int id;
//   late String name;
//   late String date;
//   late String location;
//   late String type;
//   late PickedFile image;
// ////still image
//
//
//   SurgeryDoData.fromJson(Map<String, dynamic>json)
//   {
//     id = json["id"];
//     name = json["name"];
//     location = json["location"];
//     type = json ["type"];
//     date = json["date"];
//     image= json["image"];
//   }
// }