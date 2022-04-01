import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../../shared/sharedComponent.dart';
import 'package:intl/intl.dart';


class AddVaccineScreen extends StatelessWidget {
  const AddVaccineScreen({Key? key}) : super(key: key);
  static String idAddVaccine = "IdADDVaccineScreen";

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
                  " Add Vaccine ",
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
            body: Form(
              key: cubit.formkey,
              child : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 24, 35, 24),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.camera_alt_outlined),
                                iconSize: 35.0,
                                onPressed: () {},
                              ),
                              const Text("Upload Image"),
                            ],
                          ),
                        ),
                      ) ,
                      TextAndField(
                        ontap: (){},
                        text : "Name",
                        controller: cubit.vaccineNameController,
                      ),
                      TextAndField(
                        ontap: (){},
                        text : "Type",
                        controller: cubit.typeController,
                      ),
                      TextAndField(
                        ontap: (){},
                        text : "Location",
                        controller: cubit.locationController,
                      ),
                      TextAndField(
                        ontap: (){
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.utc(2025),
                          ).then((value) {
                            cubit.dateController.text=DateFormat.yMd().format(value!);
                          });
                        },
                        text : "Date",
                        controller: cubit.dateController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultBotton(
                              text: "Save", colour: blueColor,
                              onpressed: () {
                                if (cubit.formkey.currentState!.validate()) {

                                  cubit.AddVaccineValue(
                                    name : cubit.vaccineNameController.value.text,
                                    type : cubit.typeController.value.text,
                                    location : cubit.locationController.value.text,
                                    date : cubit.dateController.value.text,
                                  );
                                  Navigator.pop(context);
                                  cubit.vaccineNameController.clear();
                                  cubit.typeController.clear();
                                  cubit.locationController.clear();
                                  cubit.dateController.clear();

                                }
                              }
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          defaultBotton(
                              text: "Cancel", colour: Colors.grey[100],
                              onpressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      )
                    ]
                ),


              ),
            ),
            ),
          );
        });
  }
}
