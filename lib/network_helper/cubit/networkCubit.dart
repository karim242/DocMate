//https://newsapi.org/
// /v2/top-headlines
// ?country=eg
// &category=health&
// apiKey=6b2ca68a49124812826713ba28b669e
//

import 'package:bloc/bloc.dart';
import 'package:docmate/models/RequestOtp.dart';
import 'package:docmate/network_helper/cubit/networlStates.dart';
import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/homePage/profilePage.dart';
import 'package:docmate/patient%20route/homePage/medicalProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../doctor route/doctorHomePage/doctorHomePage.dart';
import '../../doctor route/doctorHomePage/doctorProfile.dart';
import '../../doctor route/doctorHomePage/myPatient/doctorMedicalProfile.dart';
import '../../doctor route/doctorHomePage/myPatient/myPatients.dart';
import '../../models/searchModel.dart';
import '../dioHelper.dart';



class NetworkCubit extends Cubit<NetworkStates> {
  NetworkCubit() : super(NetworkInitStates());

  static  NetworkCubit get(context) {
    return BlocProvider.of(context);
  }
  var formkey  =GlobalKey<FormState>();

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

  //edit doctor profile text field controllers

  var editDoctorNameController = TextEditingController();
  var editDoctorLocationController = TextEditingController();
  var editDoctorMobileController = TextEditingController();




int selectedIndex = 0;
  List<BottomNavigationBarItem> patientNavList=[
    const BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.home,
      ),
      icon: Icon(
        Icons.home_outlined,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.note_add,
      ),
      icon: Icon(
        Icons.note_add_outlined,
      ),
      label: 'Medical Profile',
    ),
    const BottomNavigationBarItem(
      activeIcon:  Icon(
        Icons.person_sharp,
      ),
      icon:  Icon(
        Icons.person_outline_rounded,
      ),
      label: 'Profile',
    ),
  ];

  List<BottomNavigationBarItem> doctorNavList=[
    const BottomNavigationBarItem(
        activeIcon: Icon(
           Icons.home,
          ),
      icon: Icon(
        Icons.home_outlined,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      activeIcon:  Icon(
         Icons.groups_rounded,
          ),
      icon: Icon(
        Icons.groups_outlined,
      ),
      label: 'My Patients',
    ),
    const BottomNavigationBarItem(
      activeIcon:  Icon(
        Icons.person_sharp,
      ),
      icon:  Icon(
        Icons.person_outline_rounded,
      ),
      label: 'Profile',
    ),
  ];
  void changenav(index){
    selectedIndex=index;
    emit(ChangeBottomNavState());
  }
  List<Widget> patientScreens=[
    HomePageScreen(),
    const MedicalProfileScreen(),
    const PatientProfileScreen(),
  ];
  List<Widget> doctorScreens=[
    DoctorHomePageScreen(),
    const MyPatientsPage(),
   const DoctorProfileScreen(),
  ];

  List<dynamic> latestNew=[];
  void getLatestNews()
  {
    emit(NetworkLoadingStates());
    DioHelper.getData(
        url: "v2/top-headlines",
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




  ////for search box

  var searchController = TextEditingController();

 // late FindPatientModel findPatientModel;
  List<dynamic> findPatientList=[];
  void postSearchAPI()
  {
    emit(LoadingSearchValueStates());

    DioHelperAPI.postData(
        url: "doctor/find_patient",
        token:token,
        data: {
          "email":searchController.text,
        }
    ).then((value) {
      //findPatientModel =FindPatientModel.fromJson(value.data);
      findPatientList=value.data["data"];
      print(findPatientList);


     // print(findPatientModel.data.runtimeType);
     // print(findPatientModel.data.name);

      emit(SearchSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(SearchErrorStates(error));
    });
  }


  late RequestOtpModel requestOtpModel;
  postOtpRequest()
  {
    emit(LoadingSearchValueStates());

    DioHelperAPI.postData(
        url: "doctor/request_otp",
        token:token,
        data: {
          "email":searchController.text,
        }
    ).then((value) {
      requestOtpModel =RequestOtpModel.fromJson(value.data);

      print(requestOtpModel.message);
      print(requestOtpModel.status);
      return(requestOtpModel.status);

      emit(SearchSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(SearchErrorStates(error));
    });
  }




  //verify otp

  var verifyOtpController = TextEditingController();

  late VerifyOtpModel verifyOtpModel;
  postOtpVerify()
  {
    emit(LoadingSearchValueStates());

    DioHelperAPI.postData(
        url: "doctor/verify_otp",
        token:token,
        data: {
          "email":searchController.text,
          "otp":verifyOtpController.text,
        }
    ).then((value) {
      verifyOtpModel =VerifyOtpModel.fromJson(value.data);

      print(verifyOtpModel.message);
      print(verifyOtpModel.status);
      return(requestOtpModel.status);

      emit(SearchSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      emit(SearchErrorStates(error));
    });
  }
}


