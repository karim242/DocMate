import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import 'addVaccines.dart';

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
                onPressed: () {
                  Navigator.pushNamed(context, AddVaccineScreen.idAddVaccine);
                },
                backgroundColor: blueColor,
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                ),
              ),
              body: ListView.separated(
                itemBuilder: (context, index) => VaccineCard(context,
                    vaccineName:
                        " ${cubit.listOfVaccineNameValue[index].toString()}",
                    type: " ${cubit.listOfVaccineTypeValue[index].toString()}",
                    location:
                        " ${cubit.listOfVaccineLocationValue[index].toString()}",
                    date: " ${cubit.listOfVaccineDateValue[index].toString()}",
                    vaccineImage: const NetworkImage(
                        "https://cdn.elwatannews.com/watan/840x473/21118977271634976070.jpg")),
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 5,
                ),
                itemCount: cubit.listOfVaccineNameValue.length,
              ));
        });
  }
}

Widget VaccineCard(context,
    {
    required String vaccineName,
    required String type,
    required String location,
    required String date,
    required ImageProvider vaccineImage}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      padding: EdgeInsets.all(5),
      height: 150,
//width: MediaQuery.of(context).size.width/1.5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vaccineName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: blueColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                " Type : $type",
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Color(0xff707070)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Location :$location",
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  color: Color(0xff707070),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Date : $date",
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Color(0xff707070)),
              )
            ],
          ),
          Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: vaccineImage,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
