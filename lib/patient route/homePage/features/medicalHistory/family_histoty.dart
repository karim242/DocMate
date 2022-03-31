import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'addFamilyHistory.dart';

class FamilyHistoryScreen extends StatelessWidget {
  const FamilyHistoryScreen({Key? key}) : super(key: key);
  static String idFamilyHistory = "IdFamilyHistoryScreen";

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
                    " Family History",
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

                onPressed: (){
                  Navigator.pushNamed(context, ADDFamilyHistoryScreen.idADDFamilyHistory);
                },
                backgroundColor:blueColor,
               child: Icon(Icons.add,
                 color: whiteColor,),
              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(children: [
                  Expanded(
                    child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1,
                        children: [
                          FeatureCard(
                            textcolor :blueColor,


                              ontap: () {},
                              photoIconName: "virus",
                              text: " Haemophilia",
                              color: const Color(0xffFDF8FF)),
                          FeatureCard(
                              textcolor :blueColor,
                              ontap: () {},
                              photoIconName: "virus",
                              text: "  Haemophilia ",
                              color: const Color(0xffFDF8FF)),
                        ]),
                  ),
                ]),
              ));
        });
  }
}
