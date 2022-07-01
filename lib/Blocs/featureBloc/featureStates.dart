import '../../models/featureModels.dart';

abstract class FeatureStates{}
class InitStates extends FeatureStates{}
class LoadingValueStates extends FeatureStates{}

class FeatureSuccessStates extends FeatureStates{
   //FeaturePressureModel featurePressureModel;
   // FeaturePressureGetModel featurePressureGetModel;

 // FeatureSuccessStates(this.featurePressureModel, );
}
class FeatureErrorStates extends FeatureStates{
  final String error;

  FeatureErrorStates(this.error);
}
class ChangePatient extends FeatureStates{}
class ChangeDoctor extends FeatureStates{}

class GetProfileImageSuccessStates extends FeatureStates{}
class GetProfileImageErrorStates extends FeatureStates{}
class ActiveOrInActiveStates extends FeatureStates{}