
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
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                child: Icon(Icons.arrow_back_ios,color: Colors.black,),
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
                        backgroundImage: NetworkImage('https://via.placeholder.com/140x100'),
                      ),
                    ),


                    SizedBox(width: 10,),

                    //set doctor name here
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('doctor name',style: TextStyle(color: blueColor),),
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
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
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
                          child: Text('fasklfjokasfbujasbfjkasbfjasfbajiosfbajisfba=ssfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfaaaaaaaaafffffffffff')),

                    ),

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
                          child: Text('fasklfjokasfbujasbfjkasbfjasfbajiosfbajisfba=ssfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfsfaaaaaaaaafffffffffff')),

                    ),






                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}