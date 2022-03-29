
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';
import '../network_helper/cubit/networkCubit.dart';
import '../network_helper/cubit/networlStates.dart';

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

                          FeatureCard(icon: Icons.content_paste_outlined ,
                              text: "Medical History",color: const Color(0xffDFC8FC)),
                          FeatureCard(icon: Icons.list_alt_outlined ,
                             text: "Medical Visit",color: const Color(0xffFFAAC0)),
                          FeatureCard(icon: Icons.vaccines_sharp,
                            text: "Vaccines ",color: const Color(0xffBBEAFE)),
                          FeatureCard(icon: Icons.event_note_outlined,
                              text: "Radiology",color: const Color(0xffADFFDF)),
                          FeatureCard(icon: Icons.biotech_outlined,
                              text: "Lab Test",color: const Color(0xffDEE0DF)),
                          FeatureCard(icon: Icons.view_array_sharp,
                              text:"Blood&Glucose",color: const Color(0xffFFB5B5)),
                          FeatureCard(icon: Icons.airline_seat_flat_angled,
                              text: "Surgery",color: const Color(0xffBAFFB5)),
                        ],
                      ),
                    ),
                  ],
                ));
          }),
    );
  }

  Padding FeatureCard({
   required IconData icon,
    required String text,
    required Color color
  }) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: MaterialButton(
        onPressed: () {},
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

                const Image(


               image: AssetImage('images/img.png',),
                       fit: BoxFit.fill,
                  width:30.5,height: 70.0,
                           ),



         //  Icon(
         //      icon,
         //      size: 60,
         //     color: Colors.black38
         //     ,
         //     ),
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
