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
import '../../shared/sharedComponent.dart';
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
          //want to make it dynamic
          "country":"au",
          "category":"health",
          "apiKey":"6b2ca68a49124812826713ba28b669e9",

        }
    ).then((value)
    {
      latestNew=value.data["articles"];
      //print(latestNew.toString());
      getPatientInFo();
        emit(NetworkSuccessStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NetworkErrorStates());

    });

  }

  Map<String, dynamic>patientInfoData={};
  void getPatientInFo()
  {
    emit(LoadingPatientProfileStates());

    DioHelperAPI.getData(
      url: "patient/profile",
      token: token,

    ).then((value) {

      patientInfoData=value.data["data"];
      print(patientInfoData.values.elementAt(1));
      //  print(patientProfileModel.data.id);
      //  print(patientProfileModel.data.name);
      //  print(patientProfileModel.data.date);
      //  print(patientProfileModel.data.height);
      //  print(patientProfileModel.data.weight);
      emit(PatientProfileSuccessStates());
    }
    ).catchError((error)
    {
      print("Error is --==> $error".toString());
      emit(PatientProfileErrorStates());
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
      patientId=findPatientList[0]["id"];
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

  // List<dynamic> myPatientList=[];
  // void getDoctorPatientsAPI()
  // {
  //   emit(LoadingSearchValueStates());
  //
  //   DioHelperAPI.getData(
  //       url: "doctor/find_patient",
  //       token:token,
  //       // data: {}
  //   ).then((value) {
  //     myPatientList=value.data["data"];
  //     print(myPatientList);
  //     //patientId=findPatientList[0]["id"];
  //     print(myPatientList[0]);
  //      print(myPatientList[1]);
  //     emit(SearchSuccessStates());
  //   }
  //   ).catchError((error)
  //   {
  //     print("Error is ==> $error");
  //     emit(SearchErrorStates(error));
  //   });
  // }



  late RequestOtpModel requestOtpModel;
  void postOtpRequest()
  {
    emit(LoadingSearchValueStates());

    DioHelperAPI.postData(
        url: "doctor/request_otp",
        token:token,
        data: {

        }
    ).then((value) {
      requestOtpModel =RequestOtpModel.fromJson(value.data);
      // const sBar = SnackBar(content: Text('otp sent'),backgroundColor: Color(0xff01B9c8),);
      // ScaffoldMessenger.of(context).showSnackBar(sBar);
      // Navigator.pushNamed(
      //     context, VerifyOtp.idOVerifyOtp);
      print(requestOtpModel.message);
      print(requestOtpModel.status);
      emit(OtpReqSuccessStates(requestOtpModel));
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
  void postOtpVerify(context)
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
      //add navigator here

      if (verifyOtpModel.status == 200 ){
        navigateAndFinish(context, DoctorMedicalProfileScreen(
          patientId: findPatientList[0]["id"],
          pName:  findPatientList[0]["name"],
        index: 0,

        //  patientImage:
              ));
      //   const sBar = SnackBar(content: Text('access granted'),backgroundColor: Color(0xff01B9c8),);
      //   ScaffoldMessenger.of(context).showSnackBar(sBar);
      // }
      // else{
      //   const sBar = SnackBar(content: Text('wrong otp'),backgroundColor: Color(0xff01B9c8),);
      //   ScaffoldMessenger.of(context).showSnackBar(sBar);

       }
      print(verifyOtpModel.message);
      print(verifyOtpModel.status);
      // return(requestOtpModel.status);

      emit(OtpVerifySuccessStates(verifyOtpModel));
    }
    ).catchError((error)
    {
      print("Error is ==> $error");
      // const sBar = SnackBar(content: Text('wrong otp'),backgroundColor: Color(0xff01B9c8),);
      // ScaffoldMessenger.of(context).showSnackBar(sBar);
      emit(SearchErrorStates(error));
    });
  }
}


