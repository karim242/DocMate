import 'package:flutter/material.dart';
late String token;
late int active=0;
late int patientId;
late String doctorName;
late int prescriptionID ;
Color blueColor = const Color(0xff01B9c8);
Color whiteColor = const Color(0xFFFDF8FF);

SizedBox gap4 =  const SizedBox(height: 70,);
TextStyle text15forDateandTime = const
TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w100,color: Color(0xff707070)
);

TextStyle text20ForNameAdd=const
TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
         color: Colors.black
        );

TextStyle textTitle22Style=const
TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Color(0xff000000)
);

Widget textFieldForm({
  String? text,
  VoidCallback? ontap,
  controller,
  double? height,
  double? width,
  required bool secure,
}) {
  return Container(
      width: width,
      height: height,
      child: TextFormField(
       // onTap: text == "date" ? ontap : () {},
        controller: controller,
          obscureText:secure,
        validator: (value){
          if (value!.isEmpty)
            {
              return " $text Must Not Be Empty";
            }
          return null;
        },
        decoration: InputDecoration(

          border: OutlineInputBorder(

            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14.0),),
          labelText: "$text",

           fillColor: whiteColor,
          filled: true,
          errorStyle: const TextStyle(height: .8, color: Colors.red),
        ),
      ),

  );
}

Widget saveBotton({
  double width = 152.0,
  VoidCallback? onpressed,
}) {
  return  MaterialButton(
    color: blueColor,
      height: 44.0,
      minWidth: width,
      onPressed: onpressed,
      child: const Text(
        "Save",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white
      ),
      ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
  side: BorderSide.none,
    )
  );
}


Widget cancelBotton({
  double width = 152.0,
  VoidCallback? onpressed,
}) {
  return MaterialButton(
      height: 44.0,
      minWidth: width,
      onPressed: onpressed,
      child: Text(
        "Cancel",
      style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
        color: Colors.grey[600]
      ),
      ),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(14.0),
  side: BorderSide(color: Colors.grey)
  ),
      );
}
Widget defaultBottonTologin(
    {String? text,
    Color? Backgroundcolur,
    VoidCallback? onpressed,
    Color? textColor,
    double? height,
    double? width,
    }) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Backgroundcolur, borderRadius: BorderRadius.circular(14.0)),
    child: MaterialButton(
      onPressed: onpressed,
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    ),
  );
}

Widget logoImage() {
  return Container(
    margin:const EdgeInsets.only(right:30.0),
    height: 65.0,
    width: 280.0,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/logoImage.png'),
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}
Widget indicatorOn() {
  return Container(
    width: 11,
    height: 11,
    decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: whiteColor)),
  );
}

Widget indicatorOff() {
  return Container(
    width: 11,
    height: 11,
    decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: blueColor)),

  );
}
