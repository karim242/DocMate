
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
class ShowMedicalVisits extends StatelessWidget {
  late String? doctorName;
  late ImageProvider? doctorImage;
  // Doctor Name&photo to show in appBar
   ShowMedicalVisits({
    Key? key,
      this.doctorName,
      this.doctorImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> allPrescriptionData= cubit.allPrescriptionData;
          return Scaffold(
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
                        Text(doctorName!,style: TextStyle(color: blueColor),),
                        GestureDetector(
                          onTap: () {
                            // view the doctor who wrote the prescription profile
                          },
                          child: const Text(
                            "view Profile",
                            style: TextStyle(color: Colors.black,  fontSize: 16),
                          ),
                        ),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SizedBox(
                            width:  MediaQuery.of(context).size.width,
                            child: Text("${allPrescriptionData[1]["summary"]} "),

                      ),),

                      const SizedBox(height: 15,),

                      Text('Prescription',style: textTitle22Style,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Image.network('https://via.placeholder.com/1080x1000'),
                      ),

                      const SizedBox(height: 15,),


                      Text('Active Substance',style: textTitle22Style,),
                      Card(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SizedBox(
                            width:  MediaQuery.of(context).size.width,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
//when using the api use map function with spread operator to create text widget for each active substane
                                Text('1-fasffasfsfafasfsaf'),
                                Text('2-fasfasfasffasf')
                              ],
                            )),

                      ),

                      const SizedBox(height: 15,),

                      Text('Notes',style: textTitle22Style,),
                      Card(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SizedBox(
                            width:  MediaQuery.of(context).size.width,
                            child: Text('${allPrescriptionData[1]["notes"]}')),

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