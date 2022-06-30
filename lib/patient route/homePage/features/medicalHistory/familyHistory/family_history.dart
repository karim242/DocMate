import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Blocs/featureBloc/featureStates.dart';
import '../../../../../Blocs/featureBloc/featurecubit.dart';
import '../../../../../constant.dart';
import '../../../../../shared/sharedComponent.dart';
import 'addFamilyHistory.dart';

class FamilyHistoryScreen extends StatelessWidget {
  const FamilyHistoryScreen({Key? key}) : super(key: key);
  static String idFamilyHistory = "IdFamilyHistoryScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          List<dynamic> familyPatientData= cubit.familyHistoryPatientData;
          List<dynamic> familyDoctorData= cubit.familyHistoryDoctorListData;
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: themeAppBar(context, value: "Family History"),

              floatingActionButton:  buildFloatingActionButton(
                  context,
                  routeName: ADDFamilyHistoryScreen.idADDFamilyHistory,
                  ontap: (){}
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  Expanded(
                    child:GridView.builder(
                      padding: EdgeInsets.all(5),
                      shrinkWrap :true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.04,
                          crossAxisSpacing:12.0,
                          mainAxisSpacing: 12.0
                      ),
                      itemCount:cubit.isUser?familyDoctorData.length:familyPatientData.length ,
                      itemBuilder: (context, int index){
                        return  familyHistoryCard(
                            textcolor :blueColor,
                            ontap: () {},
                            photoIconName: "virus",
                            disease:cubit.isUser?familyDoctorData[index]["disease"]:familyPatientData[index]["disease"],
                            relation:cubit.isUser?familyDoctorData[index]["realation"]:familyPatientData[index]["realation"],
                            color: const Color(0xffFDF8FF)
                        );
                      },
                    ),
                  ),
                ]),
              ));
        });
  }
}
MaterialButton familyHistoryCard(
    {
      required String disease,
      required String relation,

      required Color color,
      required var photoIconName,
      required VoidCallback ontap,
      double width = 50,
      double height = 60,
      double textSize = 16,
      double icoWidth = 70,
      double iconHeight = 70,
      Color textcolor = Colors.white}) {
  return MaterialButton(
    minWidth: width,
    height: height,
    onPressed: ontap,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: color,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage('images/$photoIconName.png'),
          fit: BoxFit.fill,
          width: icoWidth,
          height: iconHeight,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          disease,
          maxLines: 1,
          style: TextStyle(
            fontSize: textSize,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
            relation,
            maxLines: 1,
            style:text15forDateandTime
        ),
      ],
    ),
  );
}