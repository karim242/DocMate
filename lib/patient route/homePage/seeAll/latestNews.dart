import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/network_helper/cubit/networkCubit.dart';
import 'package:docmate/network_helper/cubit/networlStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key? key}) : super(key: key);
  static String latestNewsID = "latestNewsID";


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (BuildContext context)=>NetworkCubit()..getLatestNews(),
        child : BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

           var cubit = NetworkCubit.get(context);
          dynamic data = cubit.latestNew;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                " Latest News",
                style: textTitleStyle,

              ),
              leading:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
                icon: const Icon(
                  Icons.arrow_back_ios
                 ),
               color: Colors.black,
              iconSize: 30,

            ),
            ),

            body: ConditionalBuilder(
              condition: states is ! NetworkLoadingStates,
              builder: (context)=>ListView.builder(
                    itemBuilder: (context,x) =>
                    latestNewsSilder(context,data[x]) ,
                itemCount: 19,
                ),
                fallback: (BuildContext context) {
                return const Center(child: CircularProgressIndicator(),) ;
              },
            ),


          );
        }
        )
        );
  }
}
