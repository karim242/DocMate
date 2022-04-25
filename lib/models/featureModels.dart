class FeaturePressureModel
{
  late String id;
  late String systolicPressure;
  late String diastolicPressure;
  late String time;
  late String date;
  FeaturePressureModel.fromJson(Map<String,dynamic>json)
  {
    id = json['id'];
    systolicPressure =json["systolic_pressure"];
    diastolicPressure =json["diastolic_pressure"];
    time =json["time"];
    date=json["date"];
  }
}