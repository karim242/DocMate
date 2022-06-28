import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
//for patient
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
////for Doctor
class PressureDoctorModel
{
  late PressureDoctorData data;
  PressureDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? PressureDoctorData.fromJson(json['data']) : null)!;
  }
}
class PressureDoctorData {
  late int id;
  late String systolicPressure;
  late String diastolicPressure;
  late String date;

  PressureDoctorData.fromJson(Map<String,dynamic>json)
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
class AllergyDoctorModel
{
  late AllergyDoctorData data;
  AllergyDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? AllergyDoctorData.fromJson(json['data']) : null)!;

  }
}
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



////for Family History
////for patient
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

/////for Doctor
class FamilyHistoryDocModel
{
  late FamilyHistoryDocData data;
  FamilyHistoryDocModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? FamilyHistoryDocData.fromJson(json['data']) : null)!;

  }
}
class FamilyHistoryDocData {
  late int id;
  late String disease;
  late String relation;

  FamilyHistoryDocData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    disease = json["disease"];
    relation = json["realation"];
  }
}




////for glucose
//for patient
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
////for Doctor
class GlucoseDoctorModel
{
  late GlucoseDoctorData data;
  GlucoseDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? GlucoseDoctorData.fromJson(json['data']) : null)!;

  }
}
class GlucoseDoctorData {
  late int id;
  late String glucoseResult;
  late String glucoseType;
  late String date;

  GlucoseDoctorData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    glucoseResult = json["glucos_result"];
    glucoseType = json["glucos_type"];
    date = json["date"];
  }
}


////////////////////////////for vaccine
////for patient
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


////for Doctor
class VaccineDoctorModel
{
  late VaccineDoctorData data;
  VaccineDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? VaccineDoctorData.fromJson(json['data']) : null)!;
  }
}
class VaccineDoctorData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
////still image

  VaccineDoctorData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
  }
}
///////////////////////////////////////////////

////for medical visit for doctor
class DocMedicalVisitModel{
  late MedicalVisitData data;
  DocMedicalVisitModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? MedicalVisitData.fromJson(json['data']) : null)!;
  }
}
class MedicalVisitData {
  late int id;
  late String notes;
  late String date;
  late String summary;
  late String medicine;
 // late var prescriptionPhoto;

  MedicalVisitData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
   // prescriptionPhoto = json["Prescription_photo"];
    notes = json["notes"];
    summary = json["summary"];
    medicine = json ["medicine"];
    date = json["date"];
  }

}


/////for radiology
////for patient
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
////for Doctor
class RadiologyDoctorModel
{
  late RadiologyDoctorData data;
  RadiologyDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? RadiologyDoctorData.fromJson(json['data']) : null)!;
  }
}
class RadiologyDoctorData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
////still image


  RadiologyDoctorData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
  }
}

////for labTest
//for patient
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
////for Doctor
class LabTestDoctorModel
{
  late LabTestDoctorData data;
  LabTestDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? LabTestDoctorData.fromJson(json['data']) : null)!;
  }
}
class LabTestDoctorData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
////still image

  LabTestDoctorData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
  }
}

////for Surgery
////for patient
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
  //late PickedFile image;
////still image
  SurgeryData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
    //image= json["image"];
  }
}
////for Doctor
class SurgeryDoctorModel
{
  late SurgeryDoctorData data;
  SurgeryDoctorModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? SurgeryDoctorData.fromJson(json['data']) : null)!;
  }
}
class SurgeryDoctorData {
  late int id;
  late String name;
  late String date;
  late String location;
  late String type;
  //late PickedFile image;
////still image
  SurgeryDoctorData.fromJson(Map<String, dynamic>json)
  {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    type = json ["type"];
    date = json["date"];
   // image= json["image"];
  }
}
//for active substance
class ActiveSubstanceModel{
  late ActiveSubstanceData data;
  ActiveSubstanceModel.fromJson(Map<String,dynamic>json)
  {
    data = (json['data'] != null ? ActiveSubstanceData.fromJson(json['data']) : null)!;
  }
}
class ActiveSubstanceData {
  late bool status;
  late int id;
  late String name;
  late String  message;
  ActiveSubstanceData.fromJson(Map<String, dynamic>json)
  {
    status =json["status"];
    id = json["id"];
    name = json["name"];
    message = json["message"];
  }

}
