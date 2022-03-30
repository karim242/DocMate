
import 'package:docmate/shared/sharedComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';
import '../network_helper/cubit/networkCubit.dart';
import '../network_helper/cubit/networlStates.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalProfileScreen extends StatelessWidget {
  MedicalProfileScreen({Key? key}) : super(key: key);
  static String medicalProfileID = "IdOfMedicalProfile";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NetworkCubit()..getLatestNews(),
      child: BlocConsumer<NetworkCubit, NetworkStates>(
          listener: (context, states) {},
          builder: (context, states) {
            // dynamic list= NetworkCubit.get(context).latestNew;
            NetworkCubit cubit = NetworkCubit.get(context);
            List<dynamic> data = cubit.latestNew;
            return Scaffold(
              bottomNavigationBar: MyBottomNavBar(),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Center(
                    child: Text(
                      "Medical Profile",
                      style: textTitleStyle,
                    ),
                  ),
                ),
                body: ListView(
                  children: [
                    Row(
                      children: [
                        AboelftohCard(cardColor: const Color(0xffDFC8FC), iconText: 'medical history', svgName: 'Radiology.svg',ontap: (){},),

                      ],
                    )
                  ],
                )
            );
          }),
    );
  }

}

class AboelftohCard extends StatelessWidget {
  const AboelftohCard({Key? key,required this.cardColor,required this.iconText,required this.svgName,this.ontap}) : super(key: key);
  final cardColor;
  final String iconText;
  final String svgName;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 5,
        child: Card(
          color: cardColor,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(svgName)),
                const SizedBox(height: 10,),
                Text(iconText,style: const TextStyle(color: Colors.white,fontSize: 16,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 //                  AboelftohCard(cardColor: const Color(0xffDFC8FC), iconText: 'medical history', svgName: 'medical_history.svg',ontap: (){},),