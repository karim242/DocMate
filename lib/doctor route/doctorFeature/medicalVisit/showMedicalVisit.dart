
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';

class ShowMedicalVisits extends StatelessWidget {
  late String? doctorName;
  late ImageProvider? doctorImage;

  // Doctor Name&photo to show in appBar
   ShowMedicalVisits({
    Key? key,
     required this.doctorName,
     required this.doctorImage,

  }) : super(key: key);
  //static String idShowMedicalVisit = "IdAddLabTestScreen";


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold();
        }
    );
  }
}