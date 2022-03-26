import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/register/register_cubit.dart';
import '../../../Blocs/register/register_states.dart';
import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';

class MedicalAdvices extends StatelessWidget {
  const MedicalAdvices({Key? key}) : super(key: key);
  static String medicalAdvicesId = "medicalAdvicesId";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPatientCubit, RegisterStates>(
        listener: (context, states) {},
        builder: (context, states) {
          RegisterPatientCubit cubit = RegisterPatientCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Medical Advices",
                style: textTitleStyle,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: Colors.black,
                iconSize: 30,
              ),
            ),
            body:  Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
          children: [
          Expanded(
          child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
          children: [
            medicalAdvices(
            context, onpressed: () {  },
            imageroute: 'images/covidImage.png',
            text: "  covid-19",
          ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/CovidImage1.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/CovidImage1.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/covidImage.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/covidImage.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/CovidImage1.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/CovidImage1.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/covidImage.png',
              text: "  covid-19",
            ),
            medicalAdvices(
              context, onpressed: () {  },
              imageroute: 'images/CovidImage1.png',
              text: "  covid-19",
            )
          ],
          ),
          )
          ],
          ),
            ),
          );
        });
  }
}
