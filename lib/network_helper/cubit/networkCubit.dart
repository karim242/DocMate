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