
import 'package:docmate/constant.dart';
import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/featureModels.dart';
import '../../models/featureModels.dart';
import 'featureStates.dart';

class FeatureCubit extends Cubit<FeatureStates> {
  FeatureCubit() : super(InitStates());


  static FeatureCubit get(context){
    return BlocProvider.of(context);
  }  //object from him self

  var formkey  =GlobalKey<FormState>();
  //for photo
  late PickedFile file;
  final ImagePicker picker = ImagePicker();
  Future<PickedFile> takePhoto(ImageSource source)async{
    final pickedFile = await picker.getImage(source: source);
   return  pickedFile! ;
  }
/////for Dr Surgery
  var surgeryNameController= TextEditingController();
  var surgeryTypeController= TextEditingController();
  var surgeryLocationController= TextEditingController();
  var dateSurgeryController= TextEditingController();
  // var surgeryImageController= TextEditingController() ;
  ImageProvider<Object>? surgeryImage;

  List listOfSurgeryName=[];
  List listOfSurgeryType=[];
  List listOfSurgeryLocation=[];
  List listOfSurgeryDate=[];
  List<ImageProvider<Object>> listOfSurgeryImage=[];
  void addSurgeryValue(){
   // listOfSurgeryImage.add(image);
    listOfSurgeryName.add(surgeryNameController.value.text,);
    listOfSurgeryType.add(surgeryTypeController.value.text, );
listOfSurgeryLocation.add(surgeryLocationController.value.text,);
    listOfSurgeryDate.add(dateSurgeryController.value.text,);
    emit(LoadingValueStates());
  }

  late SurgeryModel surgeryModel;
  void surgeryAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/lab",
        token:token,
        data: {
          "name":surgeryNameController.text,
          "date":dateSurgeryController.text,
          "location":surgeryLocationController.text,
          "type":surgeryTypeController.text,
          //"image":"https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg".toString()
        }
    ).then((value) {
      surgeryModel = SurgeryModel.fromJson(value.data);
      print(surgeryModel.data.id);
      print(surgeryModel.data.name);
      print(surgeryModel.data.type);
      print(surgeryModel.data.date);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }

//////////////////////////////////////////////////
////For Medical Visit
  var imageOfPrescription=TextEditingController();
  var summaryController= TextEditingController();
  var notesController= TextEditingController();
  var medicalVisitDateController= TextEditingController();

  List listOfSummary=[];
  List listOfNotes=[];
  List listOfMedicalVisitDate=[];
  List<Image> listOfImagePrescription=[];
  void addMedicalVisit()
  {
  //  listOfImagePrescription.add(imageOfPrescription,);
              listOfSummary.add(summaryController,);
                listOfNotes.add(notesController,);
     listOfMedicalVisitDate.add(medicalVisitDateController,);
    emit(LoadingValueStates());
  }
  /////////////////////////////////
////for Vaccine
  var vaccineNameController= TextEditingController();
  var vaccineTypeController= TextEditingController();
  var vaccineLocationController= TextEditingController();
  var dateVaccineController= TextEditingController();
  var vaccineImageController= TextEditingController();

  List listOfVaccineNameValue=[];
  List listOfVaccineTypeValue=[];
  List listOfVaccineLocationValue=[];
  List listOfVaccineDateValue=[];
  void AddVaccineValue(){
        listOfVaccineNameValue.add(vaccineNameController.value.text,);
        listOfVaccineTypeValue.add(vaccineTypeController.value.text,);
        listOfVaccineLocationValue.add(vaccineLocationController.value.text,);
        listOfVaccineDateValue.add(dateVaccineController.value.text,);
    emit(LoadingValueStates());
  }
  late VaccineModel vaccineModel;
  void vaccineAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/vaccine",
        token:token,
        data: {
          "name":vaccineNameController.text,
          "date":dateVaccineController.text,
          "location":vaccineLocationController.text,
          "type":vaccineTypeController.text,
          //"image":"https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg".toString()
    }
    ).then((value) {
      vaccineModel = VaccineModel.fromJson(value.data);
      print(vaccineModel.data.id);
      print(vaccineModel.data.name);
      print(vaccineModel.data.type);
      print(vaccineModel.data.date);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }


/////////////////////////////////////////////////////////////////
////for disease
  var diseaseFamilyController= TextEditingController();
  var relationFamilyController= TextEditingController();
  List listOfDiseaseValue=[];
  void AddDiseaseValue(){
    listOfDiseaseValue.add(diseaseFamilyController.value.text);
    emit(LoadingValueStates());
  }

  late FamilyHistoryModel familyHistoryModel;
  void postFamilyAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/family_history",
        token:token,
        data: {
          "disease":diseaseFamilyController.text,
          "realation":relationFamilyController.text

        }
    ).then((value) {
      familyHistoryModel = FamilyHistoryModel.fromJson(value.data);
      print(familyHistoryModel.data.id);
      print(familyHistoryModel.data.disease);
      print(familyHistoryModel.data.relation);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  ////////////////////////////////////////

  ////for Allergy
  var allergyController= TextEditingController();
  List listOfallergyValue=[];
  void AddAllergyValue(){
    listOfallergyValue.add(allergyController.value.text);
    emit(LoadingValueStates());
  }


  late AllergyModel allergyModel;
  void postAllergyAPI({String? allergy})
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/allergy",
        token:token,
        data: {
          "name":allergy
        }
    ).then((value) {
      allergyModel = AllergyModel.fromJson(value.data);
      print(allergyModel.data.allergy);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }

////////////////////////////////////////////////////////////////
  ////for radiology
  var radiologyNameController= TextEditingController();
  var radiologyTypeController= TextEditingController();
  var radiologyLocationController= TextEditingController();
  var dateRadiologyController= TextEditingController();
  var radiologyImageController= TextEditingController();
  List listOfRadiologyName=[];
  List listOfRadiologyType=[];
  List listOfRadiologyLocation=[];
  List listOfRadiologyDate=[];
  //List<ImageProvider<Object>> listOfSurgeryImage=[];
  void addRadiologyValue(){
    // listOfSurgeryImage.add(image);
      listOfRadiologyName.add(radiologyNameController.value.text,);
      listOfRadiologyType.add(radiologyTypeController.value.text, );
     listOfRadiologyLocation.add(radiologyLocationController.value.text,);
      listOfRadiologyDate.add(dateRadiologyController.value.text,);
    emit(LoadingValueStates());
  }

  late RadiologyModel radiologyModel;
  void radiologyAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/radiology",
        token:token,
        data: {
          "name":radiologyNameController.text,
          "date":dateRadiologyController.text,
          "location":radiologyLocationController.text,
          "type":radiologyTypeController.text,
          //"image":"https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg".toString()
        }
    ).then((value) {
      radiologyModel = RadiologyModel.fromJson(value.data);
      print(radiologyModel.data.id);
      print(radiologyModel.data.name);
      print(radiologyModel.data.type);
      print(radiologyModel.data.date);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  ////////////////////
////for labtest
  var labTestNameController= TextEditingController();
  var labTestTypeController= TextEditingController();
  var labTestLocationController= TextEditingController();
  var dateLabTestController= TextEditingController();
  var labTestImageController= TextEditingController();

  List listOfLabTestName=[];
  List listOfLabTestType=[];
  List listOfLabTestLocation=[];
  List listOfLabTestDate=[];
  //List<ImageProvider<Object>> listOfSurgeryImage=[];
  void addLabTestValue(){
    // listOfSurgeryImage.add(image);
        listOfLabTestName.add(labTestNameController.value.text,);
        listOfLabTestType.add(labTestTypeController.value.text,);
    listOfLabTestLocation.add(labTestLocationController.value.text,);
        listOfLabTestDate.add(dateLabTestController.value.text,);
    emit(LoadingValueStates());
  }

  late LabTestModel labTestModel;
  void labTestAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/lab",
        token:token,
        data: {
          "name":labTestNameController.text,
          "date":dateLabTestController.text,
          "location":labTestLocationController.text,
          "type":labTestTypeController.text,
          //"image":"https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg".toString()
        }
    ).then((value) {
      labTestModel = LabTestModel.fromJson(value.data);
      print(labTestModel.data.id);
      print(labTestModel.data.name);
      print(labTestModel.data.type);
      print(labTestModel.data.date);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }

  //========================
//for blood
  /////for glucose
  var measurementGlucoseController= TextEditingController();
  List<String> types = ['Random','Fasting','HbA1c'];
  String? selectedType;
  var dateGlucoseController= TextEditingController();
  List listOfGlucoseMeasure=[];
  List listOfGlucoseDate=[];
  List listOfGlucoseType=[];
  void addGlucoseValue()
  {
    listOfGlucoseMeasure.add(measurementGlucoseController.value.text);
    listOfGlucoseType.add(selectedType.toString());
    listOfGlucoseDate.add(dateGlucoseController.value.text);
    emit(LoadingValueStates());
  }

  late GlucoseModel glucoseModel;
  void postGlucoseAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/glucos",
        token:token,
        data: {
          "glucos_result":measurementGlucoseController.text,
          "glucos_type":selectedType,
          "time":"12:00",
          "date":dateGlucoseController.text
        }
    ).then((value) {
      glucoseModel = GlucoseModel.fromJson(value.data);
      print(glucoseModel.data.id);
      print(glucoseModel.data.glucoseResult);
      print(glucoseModel.data.glucoseType);
      print(glucoseModel.data.date);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }



 ////for Pressure
  var systolicPressureController= TextEditingController();
  var diastolicPressureController= TextEditingController();
  var datePressureController= TextEditingController();
  List listOfPressureMeasure1=[];
  List listOfPressureMeasure2=[];
  List listOfPressureDate=[];
  void addPressureValue()
  {
    listOfPressureMeasure1.add(systolicPressureController.value.text);
    listOfPressureMeasure2.add(diastolicPressureController.value.text);
    listOfPressureDate.add(datePressureController.value.text);
    emit(LoadingValueStates());
  }
  late FeaturePressurePostModel featurePressurePostModel;
  void PostPressureAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/pressure",
        token:token,
        data: {

        "systolic_pressure":systolicPressureController.text ,
        "diastolic_pressure": diastolicPressureController.text,
        "time": "12:00",
        "date": datePressureController.text,
        }
    ).then((value) {
       featurePressurePostModel=FeaturePressurePostModel.fromJson(value.data);
    print(featurePressurePostModel.data.diastolicPressure);
    print(featurePressurePostModel.data.date);
    print(featurePressurePostModel.data.systolicPressure);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
     emit(FeatureErrorStates(error));
    });
  }
 late FeaturePressureGetModel featurePressureGetModel;
  void getPressureAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
        url: "patient/pressure",
        token:token,

    ).then((value) {
      featurePressureGetModel=FeaturePressureGetModel.fromJson(value.data);
      print(featurePressureGetModel.data[0].systolicPressure);
      print(featurePressureGetModel.data[0].date);
      print(featurePressureGetModel.data[0].systolicPressure);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
}