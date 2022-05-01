
import 'package:docmate/doctor%20route/doctorHomePage/myPatient/doctorMedicalProfile.dart';
import 'package:docmate/doctor%20route/doctorHomePage/searchBox/otp_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant.dart';
import '../../../network_helper/cubit/networkCubit.dart';
import '../../../network_helper/cubit/networlStates.dart';

class MyPatientsPage extends StatelessWidget {
  const MyPatientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states){},
        builder: (context, states) {
      NetworkCubit cubit = NetworkCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "My Patients",
            style: textTitle22Style,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                PatientCard(
                  patientName: cubit.findPatientList[0]["name"],
                  patientId: cubit.findPatientList[0]["id"],
                  patientImage: AssetImage("images/4.png"),
                  onpressed: () {

                  },
                ),
            itemCount: 1,

          ),
        ),
      );
    }
    );
  }
}

class PatientCard extends StatelessWidget {

  late int patientId ;
  late String? patientName;
  late ImageProvider? patientImage;
  VoidCallback onpressed;
  PatientCard({Key? key,
     required this.patientId,
    required this.patientName,
    required this.patientImage,
    required this.onpressed,

  }) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 80,
        onPressed:onpressed,

        //  Navigator.push(context, MaterialPageRoute(
             // builder:(context)=>
                  //DoctorMedicalProfileScreen(
               //  pNapatientIdme: patientName!,
               //  : patientId,
               // patientImage: patientImage!
             // ) ,
        //   ),
        //   );
        // },
        elevation: 2,
        color: whiteColor,
        highlightColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image(
                  image: patientImage!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(patientName!,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: blueColor,
                ),),
                SizedBox(height: 5,),
                Text(patientId.toString(),style: text15forDateandTime),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
