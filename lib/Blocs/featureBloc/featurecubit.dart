
import 'package:docmate/constant.dart';
import 'package:docmate/models/patientModel.dart';
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

  bool isUser= true;

  void changeDoctor(){
    isUser =true;
    emit(ChangeDoctor());
  }
  void changePatient(){
    isUser =false;
    emit(ChangePatient());
  }





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
late PickedFile surgeryImage;



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
          "image":surgeryImage
        }
    ).then((value) {
      surgeryModel = SurgeryModel.fromJson(value.data);
      print(surgeryModel.data.id);
      print(surgeryModel.data.name);
      print(surgeryModel.data.type);
      print(surgeryModel.data.date);
      print(surgeryModel.data.image);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  List <dynamic> surgeryData=[];
  void getSurgeryAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/surgery/",
      token:token,

    ).then((value) {
      surgeryData = value.data["data"];
      print(surgeryData);

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

  //active substance controller
  var activeSubstanceController = TextEditingController();


  /////////////////////////////////
////for Vaccine
  var vaccineNameController= TextEditingController();
  var vaccineTypeController= TextEditingController();
  var vaccineLocationController= TextEditingController();
  var dateVaccineController= TextEditingController();
  var vaccineImageController= TextEditingController();

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
          "image":""
    }
    ).then((value) {
      vaccineModel = VaccineModel.fromJson(value.data);
      print(vaccineModel.data.id);
      print(vaccineModel.data.name);
      print(vaccineModel.data.type);
      print(vaccineModel.data.date);
     // print(vaccineModel.data);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  List <dynamic> vaccineData=[];
  void getVaccineAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/vaccine/",
      token:token,

    ).then((value) {
      vaccineData = value.data["data"];
      print(vaccineData);

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

  List <dynamic> familyHistoryData=[];
  void getFamilyHistoryAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/family_history/",
      token:token,

    ).then((value) {
      familyHistoryData = value.data["data"];
      print(familyHistoryData);

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
  ////for patient
  List <dynamic> allergyPatientListData=[];
  void getPatientAllergyAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/allergy/",
      token:token,

    ).then((value) {
      allergyPatientListData = value.data["data"];
      print(allergyPatientListData);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
////for Doctor
  List <dynamic> allergyDoctorListData=[];
  void getDoctorAllergyAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/3/allergy",
      token:token,

    ).then((value) {
      allergyDoctorListData = value.data["data"];
      print(allergyDoctorListData);

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

  List <dynamic> radiologyData=[];
  void getRadiologyAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/radiology/",
      token:token,

    ).then((value) {
      radiologyData = value.data["data"];
      print(radiologyData);

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
          // "image":,
        }
    ).then((value) {
      labTestModel = LabTestModel.fromJson(value.data);
      // print(labTestModel.data.id);
      // print(labTestModel.data.name);
      // print(labTestModel.data.type);
      // print(labTestModel.data.date);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }

  List <dynamic> labTestData=[];
  void getLabTestAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/lab",
      token:token,

    ).then((value) {
      labTestData = value.data["data"];
      print(labTestData);
     // print(labTestData[0]["name"].runtimeType,);
     // print(labTestData[0]["type"].runtimeType,);
     // print(labTestData[0]["location"].runtimeType,);
    // print(labTestData[3]["date"].runtimeType,);

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

  List <dynamic> glucoseData=[];
  void getGlucoseAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/glucos/",
      token:token,

    ).then((value) {
      glucoseData = value.data["data"];
      print(glucoseData);
     // print( glucoseData[0]["date"].runtimeType);
     // print( glucoseData[0]["glucos_result"].runtimeType);
     // print( glucoseData[0]["glucos_type"].runtimeType);

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

  late PressureModel pressureModel;
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
      pressureModel=PressureModel.fromJson(value.data);

    //print(featurePressurePostModel.data.diastolicPressure);
    //print(featurePressurePostModel.data.date);
    //print(featurePressurePostModel.data.systolicPressure);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
     emit(FeatureErrorStates(error));
    });
  }


List <dynamic> pressureData=[];
  void getPressureAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
        url: "patient/pressure/",
        token:token,

    ).then((value) {
      pressureData = value.data["data"];

     print(pressureData);
      // print(pressureData[0]["systolic_pressure"].runtimeType);
      // print(pressureData[0]["diastolic_pressure"].runtimeType);
      // print(pressureData[0]["date"].runtimeType);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
}