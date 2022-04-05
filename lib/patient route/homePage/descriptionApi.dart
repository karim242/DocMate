import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:docmate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network_helper/cubit/networkCubit.dart';
import '../../network_helper/cubit/networlStates.dart';

class DescriptionScreen extends StatelessWidget {

  static String idDescription = "IdDescriptionScreen";
   int index;

  DescriptionScreen(this.index, {Key? key}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          // dynamic list= NetworkCubit.get(context).latestNew;
          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data = cubit.latestNew;
          cubit.screens[cubit.selectedIndex];
          return SafeArea(
            child: Scaffold(
              body: ConditionalBuilder(
                condition: states is! NetworkLoadingStates,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${data [index]["urlToImage"]}'),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        Container(
                          color: Colors.grey[200],
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 4,
                                    color: blueColor,
                                  )
                                ],
                              ),
                              const SizedBox(width: 5,),
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.08,
                                    child: Text(
                                     "${data[index]["title"]}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: text20ForNameAdd,
                                    ),
                                  ),
                                  Text(
                                    "${data[index]["publishedAt"]}",
                                    style: text15forDateandTime,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/2.5,
                                margin: EdgeInsets.only(left: 10),

                            child: Text(
                            "${data[index]["description"]}",
                              maxLines: 6,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),

                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text(
                              "Source : ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${data[index]["source"]["name"]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blueColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          );
        });
  }
}
