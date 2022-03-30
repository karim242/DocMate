// import 'package:docmate/Blocs/cubit/states.dart';
// import 'package:docmate/shared/sharedComponent.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import '../Blocs/cubit/cubit.dart';
// import '../constant.dart';
// // import '../network_helper/cubit/networkCubit.dart';
// // import '../network_helper/cubit/networlStates.dart';
//
// class MedicalProfileScreen extends StatelessWidget {
//   MedicalProfileScreen({Key? key}) : super(key: key);
//   static String medicalProfileID = "IDMedicalProfile";
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserStates>(
//         listener: (context, states) {},
//         builder: (context, states) {
//           // var cubit = UserCubit.get(context);
//           // dynamic data = cubit.latestNew;
//           return Scaffold(
//               bottomNavigationBar: MyBottomNavBar(),
//               appBar: AppBar(
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 title: Center(
//                   child: Text(
//                     "Medical Profile",
//                     style: textTitleStyle,
//                   ),
//                 ),
//               ),
//               body: ListView(
//                 children: [
//                   Row(children: [
//                     AboelftohCard(
//                       cardColor: const Color(0xffDFC8FC),
//                       iconText: 'medical history',
//                       svgName: 'Radiology.svg',
//                       ontap: () {},
//                     ),
//                     AboelftohCard(
//                       cardColor: const Color(0xffDFC8FC),
//                       iconText: 'medical history',
//                       svgName: 'Radiology.svg',
//                       ontap: () {},
//                     )
//                   ])
//                 ],
//               )
//               // Expanded(
//               //   child: GridView.count(
//               //     physics: const BouncingScrollPhysics(),
//               //     crossAxisCount: 2,
//               //     crossAxisSpacing: 8,
//               //     mainAxisSpacing: 8,
//               //     childAspectRatio: 1.04,
//               //     children: [
//               //       FeatureCard(
//               //         //  icon: Icons.content_paste_outlined,
//               //           text: "Medical History",
//               //           color: const Color(0xffDFC8FC)),
//               //       FeatureCard(
//               //          // icon: Icons.list_alt_outlined,
//               //           text: "Medical Visit",
//               //           color: const Color(0xffFFAAC0)),
//               //       FeatureCard(
//               //          // icon: Icons.vaccines_sharp,
//               //           text: "Vaccines ",
//               //           color: const Color(0xffBBEAFE)),
//               //       FeatureCard(
//               //          // icon: Icons.event_note_outlined,
//               //           text: "Radiology",
//               //           color: const Color(0xffADFFDF)),
//               //       FeatureCard(
//               //          // icon: Icons.biotech_outlined,
//               //           text: "Lab Test",
//               //           color: const Color(0xffDEE0DF)),
//               //       FeatureCard(
//               //        //   icon: Icons.view_array_sharp,
//               //           text: "Blood&Glucose",
//               //           color: const Color(0xffFFB5B5)),
//               //       FeatureCard(
//               //          // icon: Icons.airline_seat_flat_angled,
//               //           text: "Surgery",
//               //           color: const Color(0xffBAFFB5)),
//               //     ],
//               //   ),
//               // ),
//
//               );
//         });
//   }
// }
//
// //
// class AboelftohCard extends StatelessWidget {
//   const AboelftohCard(
//       {Key? key,
//       required this.cardColor,
//       required this.iconText,
//       required this.svgName,
//       this.ontap})
//       : super(key: key);
//   final cardColor;
//   final String iconText;
//   final String svgName;
//   final ontap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         margin: EdgeInsets.all(10),
//         height: MediaQuery.of(context).size.height / 4.5,
//         width: MediaQuery.of(context).size.width / 2.5,
//         child: Card(
//           color: cardColor,
//           child: SizedBox(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image(
//                   image: AssetImage(
//                     'images/family.png',
//                   ),
//                   fit: BoxFit.fill,
//                   width: 70.5,
//                   height: 70.0,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   iconText,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';
import '../network_helper/cubit/networkCubit.dart';
import '../network_helper/cubit/networlStates.dart';
import '../shared/sharedComponent.dart';

class MedicalProfileScreen extends StatelessWidget {
  const MedicalProfileScreen({Key? key}) : super(key: key);
  static String medicalProfileID = "IdOfMedicalProfile";

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NetworkCubit, NetworkStates>(
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
                      "Medical Profile",
                      style: textTitleStyle,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.04,
                        children: [

                          FeatureCard(
                              text: "Medical History",color: const Color(0xffDFC8FC)),
                          FeatureCard(
                              text: "Medical Visit",color: const Color(0xffFFAAC0)),
                          FeatureCard(
                              text: "Vaccines ",color: const Color(0xffBBEAFE)),
                          FeatureCard(
                              text: "Radiology",color: const Color(0xffADFFDF)),
                          FeatureCard(
                              text: "Lab Test",color: const Color(0xffDEE0DF)),
                          FeatureCard(
                              text:"Blood&Glucose",color: const Color(0xffFFB5B5)),
                          FeatureCard(
                              text: "Surgery",color: const Color(0xffBAFFB5)),
                        ],
                      ),
                    ),
                  ],
                ),
              // bottomNavigationBar:BottomNavigationBar(
              //     currentIndex: cubit.selectedIndex,
              //     items: cubit.navList,
              //     onTap: (index) {
              //       cubit.changenav(index);
              //     }
              // ),
              bottomNavigationBar: MyBottomNavBar(),
            );
          }

    );
  }

  Padding FeatureCard({
    required String text,
    required Color color
  }) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: MaterialButton(
        onPressed: () {},
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Image(
              image: AssetImage('images/family.png',),
              fit: BoxFit.fill,
              width:70.5,height: 70.0,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              // maxLines: 1,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
