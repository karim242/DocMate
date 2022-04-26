// https://newsapi.org/v2/everything?
// q=tesla&from=2022-02-26&sortBy=publishedAt&
// apiKey=6b2ca68a49124812826713ba28b669e9

import 'package:dio/dio.dart';
 class DioHelper
 {
  static Dio? dio;
  static init(){
    dio=Dio(
    BaseOptions(
    baseUrl: "https://newsapi.org/",
    receiveDataWhenStatusError: true
    ),
    );
}

 static Future <Response> getData(
  {
   required String url,
  required Map<String,dynamic> query
 })async
{
   return await dio!.get(
       url,
       queryParameters: query) ;
}

 }

class DioHelperAPI
{
   static   Dio? dio ;
  static init(){
    dio=Dio(
      BaseOptions(
          baseUrl: "http://docmate.herokuapp.com/api/",
          receiveDataWhenStatusError: true,

      ),
    );
  }
  static Future<Response> postData(
      {
        required String url,
        Map<String,dynamic>? query,
        required  Map<String, dynamic> data,
        String? token ,
      })async{
   dio?.options.headers = {
     "Accept":"application/json",
     'auth-token': token,
   };
    return await dio!.post(
      url,
      data: data
    );
        }


   static Future<Response> getData({
     required String url,
     Map<String, dynamic>? query,
     String? token,
   }) async {
     dio?.options.headers = {
       "Accept":"application/json",
       'auth-token': token,
     };
     return await dio!.get(
       url,
       queryParameters: query,
     );
   }

}
