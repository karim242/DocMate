
import 'dart:io';

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

 late bool isUser;

  void changeDoctor(){
    isUser =true;
    emit(ChangeDoctor());
  }
  void changePatient(){
    isUser =false;
    emit(ChangePatient());
  }





  //for photo
//   File? profileImage;
//   Future <void>getImage()async{
//     final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//     if(pickedFile !=null)
//     {
//       profileImage=File(pickedFile.path);
//       emit(GetProfileImageSuccessStates());
//     }
//     else
//       {
//         print("nothing selected");
//         emit(GetProfileImageErrorStates());
//       }
// }
  //////////
  //for image old code
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
  List <dynamic> surgeryPatientData=[];
  void getSurgeryPatientAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/surgery/",
      token:token,

    ).then((value) {
      surgeryPatientData = value.data["data"];
      print(surgeryPatientData);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  List<dynamic>surgeryDoctorData=[];
  void getSurgeryDoctorAPI(int id, int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/$id/surgery/",
      token:token,

    ).then((value) {
      surgeryDoctorData = value.data["data"];
      print(surgeryDoctorData[1]);
      patientId=surgeryDoctorData[index]["id"];
      print(surgeryDoctorData[index]["id"]);

      //print(labTestDoctorData[0]["name"].runtimeType,);
      // print(labTestDoctorData[0]["type"].runtimeType,);
      // print(labTestDoctorData[0]["location"].runtimeType,);
      // print(labTestDoctorData[3]["date"].runtimeType,);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  ////////////////////////////////////////////////////
  // for prescription id
   List prescriptionIdData=[];
  late int prescriptionID ;
  void getPrescriptionIDAPI(int patientId)
  {emit(LoadingValueStates());
  DioHelperAPI.getData(
    url: "doctor/$patientId/prescription/",
    token:token,
  ).then((value) {
    prescriptionIdData = value.data["data"];
    prescriptionID=prescriptionIdData[0]["id"];
    print(prescriptionID);
    emit(FeatureSuccessStates());}
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



  late DocMedicalVisitModel docMedicalVisitModel;
  //var docMedicalVisit=[];
  void  docMedicalVisitModelAPI(int id)
  {
    emit(LoadingValueStates());
    DioHelperAPI.postData(
        url: "doctor/$id/prescription/$prescriptionID",
        token:token,
        data: {
          //"Prescription_photo":imageOfPrescription.value,
          "summary":summaryController.text,
          "notes":notesController.text,
          "date":medicalVisitDateController.text,
        }
    ).then((value) {
      //docMedicalVisit = value.data['data'];
      //print(docMedicalVisit);
      docMedicalVisitModel = DocMedicalVisitModel.fromJson(value.data);
      //print(docMedicalVisitModel.data.id);
      //print(docMedicalVisitModel.data.date);
      emit(FeatureSuccessStates());}
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }

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
          "type":vaccineTypeController.text,}
    ).then((value) {
      vaccineModel = VaccineModel.fromJson(value.data);
      print(vaccineModel.data);
      //print(vaccineModel.data.name);
     //  print(vaccineModel.data.type);
     //  print(vaccineModel.data.date);
     // // print(vaccineModel.data);
      emit(FeatureSuccessStates());}
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }

  List <dynamic> vaccinePatientData=[];
  void getVaccinePatientAPI()
  {emit(LoadingValueStates());
    DioHelperAPI.getData(
      url: "patient/vaccine/",
      token:token,
    ).then((value) {
      vaccinePatientData = value.data["data"];
      print(vaccinePatientData);
      emit(FeatureSuccessStates());}
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
   List <dynamic> vaccineDoctorData=[];
  void getVaccineDoctorAPI(int id, int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/$id/vaccine/",
      token:token,

    ).then((value) {
      vaccineDoctorData = value.data["data"];
      print(vaccineDoctorData);
      patientId=vaccineDoctorData[index]["id"];
      print(vaccineDoctorData[index]["id"]);
      //print(labTestDoctorData[0]["name"].runtimeType,);
      // print(labTestDoctorData[0]["type"].runtimeType,);
      // print(labTestDoctorData[0]["location"].runtimeType,);
      // print(labTestDoctorData[3]["date"].runtimeType,);
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

  List <dynamic> familyHistoryPatientData=[];
  void getFamilyHistoryAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/family_history/",
      token:token,

    ).then((value) {
      familyHistoryPatientData = value.data["data"];
      print(familyHistoryPatientData);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  List <dynamic> familyHistoryDoctorListData=[];
  void getDoctorFamilyHistoryAPI(int id, int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/${id}/family_history",
      token:token,

    ).then((value) {
      familyHistoryDoctorListData = value.data["data"];
      patientId=familyHistoryDoctorListData[index]["id"];
      print(familyHistoryDoctorListData[index]["id"]);
      print(familyHistoryDoctorListData);


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
  late AllergyPatientModel allergyModel;
  void postAllergyAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/allergy",
        token:token,
        data: {
          "name":allergyController.text
        }
    ).then((value) {
      allergyModel = AllergyPatientModel.fromJson(value.data);
      print(allergyModel.data.allergy);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  late AllergyDoctorModel allergyDoctorModel;
  void postAllergyDoctorAPI(int id )
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "doctor/$id/allergy",
        token:token,
        data: {
          "name":allergyController.text
        }
    ).then((value) {
      allergyDoctorModel = AllergyDoctorModel.fromJson(value.data);
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
//// get for Doctor
  List <dynamic> allergyDoctorListData=[];
  void getDoctorAllergyAPI(int id, int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/${id}/allergy",
      token:token,

    ).then((value) {
      allergyDoctorListData = value.data["data"];
      print(allergyDoctorListData[0]["allergy"]);
      patientId=allergyDoctorListData[index]["id"];


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
  List <dynamic> radiologyPatientData=[];
  void getRadiologyPatientAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/radiology/",
      token:token,

    ).then((value) {
      radiologyPatientData = value.data["data"];
      print(radiologyPatientData);

      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
  //for get  doctor
  List <dynamic> radiologyDoctorData=[];
  void getRadiologyDoctorAPI(int id, int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/$id/radiology",
      token:token,

    ).then((value) {
      radiologyDoctorData = value.data["data"];
      print(radiologyDoctorData);
      patientId=radiologyDoctorData[index]["id"];
      print(radiologyDoctorData[index]["id"]);
      //print(labTestDoctorData[0]["name"].runtimeType,);
      // print(labTestDoctorData[0]["type"].runtimeType,);
      // print(labTestDoctorData[0]["location"].runtimeType,);
      // print(labTestDoctorData[3]["date"].runtimeType,);

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

  List <dynamic> labTestPatientData=[];
  void getLabTestPatientAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/lab",
      token:token,

    ).then((value) {
      labTestPatientData = value.data["data"];
      print(labTestPatientData);
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
  List <dynamic> labTestDoctorData=[];
  void getLabTestDoctorAPI(int id,int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/$id/lab",
      token:token,

    ).then((value) {
      labTestDoctorData = value.data["data"];
      print(labTestDoctorData);
      patientId=labTestDoctorData[index]["id"];
      print(labTestDoctorData[index]["id"]);
       //print(labTestDoctorData[0]["name"].runtimeType,);
      // print(labTestDoctorData[0]["type"].runtimeType,);
      // print(labTestDoctorData[0]["location"].runtimeType,);
      // print(labTestDoctorData[3]["date"].runtimeType,);

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

  List <dynamic> glucosePatientData=[];
  void getPatientGlucoseAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/glucos/",
      token:token,

    ).then((value) {
      glucosePatientData = value.data["data"];
      print(glucosePatientData);
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

//for get doctor
  List <dynamic> glucoseDoctorData=[];
  void getDoctorGlucoseAPI(int id,int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/$id/glucos",
      token:token,

    ).then((value) {
      glucoseDoctorData = value.data["data"];
      patientId=glucoseDoctorData[index]["id"];
      print(glucoseDoctorData[index]["id"]);
      print(glucoseDoctorData);
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


List <dynamic> pressurePatientData=[];
  void getPatientPressureAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
        url: "patient/pressure/",
        token:token,

    ).then((value) {
      pressurePatientData = value.data["data"];

     print(pressurePatientData);
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
  //fo get doctor
  List <dynamic>  pressureDoctorData=[];
  void getDoctorPressureAPI(int id,int index)
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "doctor/$id/pressure",
      token:token,

    ).then((value) {
      pressureDoctorData = value.data["data"];
      print(pressureDoctorData);
      patientId=pressureDoctorData[index]["id"];
      print(pressureDoctorData[index]["id"]);
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


  ////for Prescription
//// get patient
  List <dynamic> prescriptionPatientData=[];
  void getPrescriptionPatientAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.getData(
      url: "patient/prescription",
      token:token,

    ).then((value) {
      prescriptionPatientData = value.data["data"];
      print(prescriptionPatientData);
      emit(FeatureSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(FeatureErrorStates(error));
    });
  }
}