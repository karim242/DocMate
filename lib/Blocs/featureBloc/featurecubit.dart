
import 'package:docmate/network_helper/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
  var typeController= TextEditingController();
  var locationController= TextEditingController();
  var dateVaccineController= TextEditingController();
  var vaccineImageController= TextEditingController();

  List listOfVaccineNameValue=[];
  List listOfVaccineTypeValue=[];
  List listOfVaccineLocationValue=[];
  List listOfVaccineDateValue=[];
  void AddVaccineValue(){
        listOfVaccineNameValue.add(vaccineNameController.value.text,);
        listOfVaccineTypeValue.add(typeController.value.text,);
    listOfVaccineLocationValue.add(locationController.value.text,);
        listOfVaccineDateValue.add(dateVaccineController.value.text,);
    emit(LoadingValueStates());
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
  ////////////////////////////////////////

  ////for Allergy
  var allergyController= TextEditingController();
  List listOfallergyValue=[];
  void AddAllergyValue(){
    listOfallergyValue.add(allergyController.value.text);
    emit(LoadingValueStates());
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
  late FeaturePressureModel featurePressureModel;
  void PressureAPI()
  {
    emit(LoadingValueStates());

    DioHelperAPI.postData(
        url: "patient/pressure",
        data: {

        "systolic_pressure":systolicPressureController.text ,
        "diastolic_pressure": diastolicPressureController.text,
        "time": "12:00",
        "date": datePressureController.text,
        }
    ).then((value) {
       featurePressureModel=FeaturePressureModel.fromJson(value.data);
    print(featurePressureModel.diastolicPressure);
    print(featurePressureModel.date);
    print(featurePressureModel.systolicPressure);
      emit(FeatureSuccessStates(featurePressureModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
     emit(FeatureErrorStates(error));
    });
  }


}