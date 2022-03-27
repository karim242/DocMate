//https://newsapi.org/
// /v2/top-headlines
// ?country=eg
// &category=health&
// apiKey=6b2ca68a49124812826713ba28b669e
//


import 'package:bloc/bloc.dart';
import 'package:docmate/network_helper/cubit/networlStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dioHelper.dart';



class NetworkCubit extends Cubit<NetworkStates> {
  NetworkCubit() : super(NetworkInitStates());

  static  NetworkCubit get(context) {
    return BlocProvider.of(context);
  }
  final int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 8, fontWeight: FontWeight.w100);
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