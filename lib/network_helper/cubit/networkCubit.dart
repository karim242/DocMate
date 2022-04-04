//https://newsapi.org/
// /v2/top-headlines
// ?country=eg
// &category=health&
// apiKey=6b2ca68a49124812826713ba28b669e
//

import 'package:bloc/bloc.dart';
import 'package:docmate/network_helper/cubit/networlStates.dart';
import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/homePage/profilePage.dart';
import 'package:docmate/patient%20route/homePage/seeAll/medicalAdvices.dart';
import 'package:docmate/patient%20route/homePage/medicalProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dioHelper.dart';



class NetworkCubit extends Cubit<NetworkStates> {
  NetworkCubit() : super(NetworkInitStates());

  static  NetworkCubit get(context) {
    return BlocProvider.of(context);
  }
  var formkey  =GlobalKey<FormState>();
  List listOfallergyValue=[];
  void AddAllergyValue(value){
    listOfallergyValue.add(value.toString());
    emit(LoadingValueStates());
  }
  List listOfDiseaseValue=[];
    void AddDiseaseValue(value){
    listOfDiseaseValue.add(value.toString());
    emit(LoadingValueStates());
  }


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
  var measurementController1= TextEditingController();
  var measurementController2= TextEditingController();
  List<String> types = ['Random','Fasting','HbA1c'];
  String? selectedType;
  var datePressureController= TextEditingController();


  var vaccineNameController= TextEditingController();
  var typeController= TextEditingController();
  var locationController= TextEditingController();
  var dateVaccineController= TextEditingController();
  var vaccineImageController= TextEditingController();

  var labTestNameController= TextEditingController();
  var labTestTypeController= TextEditingController();
  var labTestLocationController= TextEditingController();
  var dateLabTestController= TextEditingController();
  var labTestImageController= TextEditingController();

  var radiologyNameController= TextEditingController();
  var radiologyTypeController= TextEditingController();
  var radiologyLocationController= TextEditingController();
  var dateRadiologyController= TextEditingController();
  var radiologyImageController= TextEditingController();


  var allergyController= TextEditingController();
  var diseaseFamilyController= TextEditingController();
  var relationFamilyController= TextEditingController();
  static const TextStyle optionStyle =
  TextStyle(fontSize: 8, fontWeight: FontWeight.w100);


  //Edit Profile Text Field Controller
  var editNameController = TextEditingController();
  var editEmailController = TextEditingController();
  var editDateOfBirthController = TextEditingController();
  var editHeightController = TextEditingController();
  var editWeightController = TextEditingController();
  var editBloodTypeController = TextEditingController();
  var editLocationController = TextEditingController();
int selectedIndex = 0;
  List<BottomNavigationBarItem> navList=[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.note_add_outlined,
      ),
      label: 'Medical Profile',
    ),
    const BottomNavigationBarItem(
      icon:  Icon(
        Icons.person_sharp,
      ),
      label: 'Profile',
    ),
  ];
  void changenav(index){
    selectedIndex=index;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens=[
   HomePageScreen(),
    const MedicalProfileScreen(),
   const PatientProfileScreen(),
  ];

  List<dynamic> latestNew=[];
  void getLatestNews()
  {
    emit(NetworkLoadingStates());
    DioHelper.getData(url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"health",
          "apiKey":"6b2ca68a49124812826713ba28b669e9",

        }
    ).then((value)
    {
      latestNew=value.data["articles"];
      //print(latestNew.toString());

        emit(NetworkSuccessStates());

    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NetworkErrorStates());

    });

  }
}