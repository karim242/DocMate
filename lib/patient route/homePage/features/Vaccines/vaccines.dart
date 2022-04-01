import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({Key? key}) : super(key: key);
  static String idVaccine = "IdVaccineScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          // dynamic list= NetworkCubit.get(context).latestNew;
          NetworkCubit cubit = NetworkCubit.get(context);
          List<dynamic> data = cubit.latestNew;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(
                  " Vaccines ",
                  style: textTitle22Style,
                ),
              ),
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: blueColor,
              child: Icon(
                Icons.add,
                color: whiteColor,
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    height: 130,
                  //width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Virus Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: blueColor,
                              ),
                            ),
                            SizedBox(height: 5,),
                            const Text(
                              " Type : ------------",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                  color: Color(0xff707070)),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Location :------",
                              style: const TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 14,
                                color: Color(0xff707070),
                              ),
                            ),
                            SizedBox(height: 5,),
                            const Text(
                              "Data : ----------",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                  color: const Color(0xff707070)),
                            )
                          ],
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width/5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image(
                            image: NetworkImage(
                                "https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg"),
                            width:120,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context,index)=>Container(
                  width: double.infinity,
                  height: 5,
                ),
                itemCount: 1)
          );
        });
  }
}
