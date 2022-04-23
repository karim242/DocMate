
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

////For Medical Visit
  var imageOfPrescription=TextEditingController();
  var summaryController= TextEditingController();
  var notesController= TextEditingController();
  var medicalVisitDateController= TextEditingController();

  List listOfSummary=[];
  List listOfNotes=[];
  List listOfMedicalVisitDate=[];
  List<Image> listOfImagePrescription=[];
  void addMedicalVisit({image,summary,notes,date})
  {
    listOfImagePrescription.add(image);
    listOfSummary.add(summary.toString());
    listOfNotes.add(notes.toString());
    listOfMedicalVisitDate.add(date.toString());
    emit(LoadingValueStates());
  }
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
  void AddVaccineValue({name,type,location,date}){
    listOfVaccineNameValue.add(name.toString());
    listOfVaccineTypeValue.add(type.toString());
    listOfVaccineLocationValue.add(location.toString());
    listOfVaccineDateValue.add(date.toString());
    emit(LoadingValueStates());
  }
/////////////////////////////////////////////////////////////////
////for disease
  var diseaseFamilyController= TextEditingController();
  var relationFamilyController= TextEditingController();
  List listOfDiseaseValue=[];
  void AddDiseaseValue(value){
    listOfDiseaseValue.add(value.toString());
    emit(LoadingValueStates());
  }
  ////////////////////////////////////////

  ////for Allergy
  var allergyController= TextEditingController();
  void AddAllergyValue(value){
    listOfallergyValue.add(value.toString());
    emit(LoadingValueStates());
  }List listOfallergyValue=[];
////////////////////////////////////////////////////////////////
  ////for radiology
  var radiologyNameController= TextEditingController();
  var radiologyTypeController= TextEditingController();
  var radiologyLocationController= TextEditingController();
  var dateRadiologyController= TextEditingController();
  var radiologyImageController= TextEditingController();
  ////////////////////
////for labtest
  var labTestNameController= TextEditingController();
  var labTestTypeController= TextEditingController();
  var labTestLocationController= TextEditingController();
  var dateLabTestController= TextEditingController();
  var labTestImageController= TextEditingController();
  //========================
//for blood
  var measurementPressureController1= TextEditingController();
  var measurementPressureController2= TextEditingController();
  var measurementGlucoseController= TextEditingController();
  List<String> types = ['Random','Fasting','HbA1c'];
  String? selectedType;
  var datePressureController= TextEditingController();
  var dateGlucoseController= TextEditingController();






}