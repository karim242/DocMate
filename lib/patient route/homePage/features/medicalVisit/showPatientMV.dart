
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../constant.dart';
import '../../../../doctor route/doctorHomePage/doctorProfile.dart';
import '../../../../shared/sharedComponent.dart';

class ShowPatientMedicalVisits extends StatelessWidget {
  late int indexItem;
  ShowPatientMedicalVisits(
      {Key? key, required this.indexItem,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> prescriptionPatientData= cubit.prescriptionPatientData;
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                leading: GestureDetector(
                  child: const Icon(Icons.arrow_back_ios,color: Colors.black,),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage('https://encrypted-tbn2.gstatic.com/'
                              'images?q=tbn:ANd9GcSQntRPY-paKdW16dfSuNGw-aXz6t3fWCm3KlEMwM5YO7BbXge_'),
                        ),
                      ),


                      const SizedBox(width: 10,),

                      //set doctor name here
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr/ ${prescriptionPatientData[indexItem]["doctor_name"]}",
                            style: TextStyle(color: blueColor),),
                        ],
                      )
                    ],
                  ),
                ),),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Summary',style: textTitle22Style,),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width:  MediaQuery.of(context).size.width,
                            child: Text("${prescriptionPatientData[indexItem]["summary"]} "),

                          ),),

                        const SizedBox(height: 15,),

                        Text('Prescription',style: textTitle22Style,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Image.network('https://miro.medium.com/max/1400/'
                              '1*5ZySboqmOOrgUYA9qhaS7w.jpeg'),
                        ),

                        const SizedBox(height: 15,),


                        Text('Active Substance',style: textTitle22Style,),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: SizedBox(
                              width:  MediaQuery.of(context).size.width,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  prescriptionPatientData[indexItem]["medicine"] == null
                                    ?const Text("No Active Substance added !")
                                    :

                                Text(prescriptionPatientData[indexItem]["medicine"][0]["name"]),
                                ],
                              )),

                        ),

                        const SizedBox(height: 15,),

                        Text('Notes',style: textTitle22Style,),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: SizedBox(
                              width:  MediaQuery.of(context).size.width,
                              child: Text('${prescriptionPatientData[indexItem]["notes"]}')),

                        ),

                      ],
                    ),
                  ),

                  itemCount: 1,
                ),
              )

          );
        }
    );
  }
}