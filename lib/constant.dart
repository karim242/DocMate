import 'package:flutter/material.dart';

Color blueColor = const Color(0xff01B9c8);
Color whiteColor = const Color(0xfffdf8ff);
var textStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);


Widget textFieldForm({String? text, VoidCallback? ontap, controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
    child: Container(
      width: 320.0,
      height: 44,
      child: TextFormField(
        onTap: text == "date" ? ontap : () {},
        controller: controller,
        validator: (value){
          if (value!.isEmpty)
            {
              return " $text Must Be Empty";
            }
          return null;
        },
        decoration: InputDecoration(
          labelText: "$text",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    ),
  );
}

Widget defaultBotton({
  String? text,
  double width = 152.0,
  Color? colour,
  VoidCallback? onpressed,
}) {
  return Container(
    height: 44.0,
    width: width,
    // color: Colors.blue,
    decoration:
        BoxDecoration(color: colour, borderRadius: BorderRadius.circular(16.0)),
    child: MaterialButton(
      onPressed: onpressed,
      child: Text("$text"),
    ),
  );
}

Widget defaultBottonTologin(
    {String? text,
    Color? Backgroundcolur,
    VoidCallback? onpressed,
    Color? textColor}) {
  return Container(
    height: 44.0,
    width: 256.0,
    decoration: BoxDecoration(
        color: Backgroundcolur, borderRadius: BorderRadius.circular(16.0)),
    child: MaterialButton(
      onPressed: onpressed,
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: 'MPLUsRounded1c',
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
    width: 270.0,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/logoImage.png'),
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}