import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/homePage/medicalProfile.dart';
import 'package:docmate/patient%20route/homePage/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant.dart';
import 'package:image_picker/image_picker.dart';

import '../patient route/homePage/descriptionApi.dart';

MaterialButton latestNewsSilder(context, articles, {required int index}) {
  return MaterialButton(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DescriptionScreen(index)),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.25,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('${articles[index]['urlToImage']}')),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 16,
          child: Center(
            child: Text(
              '${articles[index]['title']}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                backgroundColor: whiteColor,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

MaterialButton medicalAdvices(
  context, {
  required dynamic articles,
  required int index,
}) {
  return MaterialButton(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DescriptionScreen(index)),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('${articles[index]['urlToImage']}')),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 20,
          child: Center(
            child: Text(
              '${articles[index]['title']}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                backgroundColor: whiteColor,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget titleAndSeeAll(
  context, {
  required String titletext,
  required VoidCallback onpressed,
  required int sizedWidth,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 250,
        horizontal: MediaQuery.of(context).size.width / 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          titletext,
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / sizedWidth,
        ),
        TextButton(
            onPressed: onpressed,
            child: Text(
              "See All",
              style: TextStyle(
                fontSize: 18,
                color: blueColor,
              ),
            ))
      ],
    ),
  );
}

CarouselSlider carouselSlider(
  context,
  articles,
) {
  return CarouselSlider.builder(
    itemCount: 8,
    itemBuilder: (BuildContext context, int index, int realIndex) {
      return ListView(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DescriptionScreen(index)),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 4.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${articles[index+1]['urlToImage']}')),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Text(
            '${articles[index+1]['title']}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              backgroundColor: whiteColor,
            ),
          ),
          // ),//
        ],
        // ),
      );
    },
    options: CarouselOptions(
      height: MediaQuery.of(context).size.height / 4,
      enlargeCenterPage: true,
      autoPlay: false,
    ),
  );
}

ListTile TitleInDrawer({
  required IconData icons,
  required String text,
  required VoidCallback ontap,
}) {
  return ListTile(
    leading: Icon(
      icons,
      size: 32,
    ),
    title: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    onTap: ontap,
  );
}

MaterialButton FeatureCard(
    {required String text,
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
          text,
          maxLines: 1,
          style: TextStyle(
            fontSize: textSize,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

AppBar themeAppBar(context, {required String value}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Center(
      child: Text(
        value,
        style: textTitle22Style,
      ),
    ),
    leading: IconButton(
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    ),
  );
}

Widget TextAndField({
  required String text,
  required controller,
  required VoidCallback ontap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        text,
        style: text20ForNameAdd,
      ),
      const SizedBox(height: 5),
      Container(
        height: 44,
        child: TextFormField(
            onTap: text == "Date" ? ontap : () {},
            cursorHeight: 20,
            controller: controller,
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.isEmpty) {
                return "please add $text";
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0),
              ),
              fillColor: whiteColor,
              filled: true,
              errorStyle: const TextStyle(height: .8, color: Colors.red),
            )),
      )
    ],
  );
}

Widget ThemeCard(context,
    {required String name,
    required String type,
    required String location,
    required String date,
    //required FileImage image
    }) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      padding: const EdgeInsets.all(5),
      height: 150,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: blueColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                " Type : $type",
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Color(0xff707070)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Location :$location",
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  color: Color(0xff707070),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Date : $date",
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Color(0xff707070)),
              )
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 120,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      "https://www.researchgate."
                          "net/profile/Sylvia-Asa/publication/319357366/"
                          "figure/fig2/AS:613886776573952@1523373421045/"
                          "The-consolidated-theranostic-report-surgical-"
                          "pathology-An-example-deidentified-to.png"),

                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

FloatingActionButton buildFloatingActionButton(context,
    {required String routeName}) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed(context, routeName);
    },
    backgroundColor: blueColor,
    child: Icon(
      Icons.add,
      color: whiteColor,
    ),
  );
}

Widget line(context) {
  return Container(
    color: Colors.grey,
    height: 1,
    width: MediaQuery.of(context).size.width / 3.1,
  );
}

Container fieldForMeasurement({
  required controller,
}) {
  return Container(
    width: 60,
    height: 50,
    child: TextFormField(
      cursorHeight: 20,
      controller: controller,
      cursorColor: Colors.black,
      validator: (value) {
        if (value!.isEmpty) {
          return "please add Measurement ";
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16.0),
        ),
        fillColor: whiteColor,
        filled: true,
        errorStyle: const TextStyle(height: .8, color: Colors.red),
      ),
    ),
  );
}



void showToast({required String msg, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0);
enum ToastStates { SUCCESS, ERROR }
Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);


void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );


Widget ImageProfileBottomSheet(var cubit , bool user){
  return Container(
    height: 100,
    width: 300,
    margin: const EdgeInsets.symmetric(
        vertical: 20, horizontal: 20),
    child: Column(
      children: [
        const Text(
          'choose profile photo',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            TextButton.icon(
            onPressed: () {
               user==true
                   ? cubit.getImage(ImageSource.camera)
                   :cubit.getDoctorImage(ImageSource.camera);
              },
              icon: const Icon(Icons.camera),
              label: const Text('camera'),
            ),
            TextButton.icon(
              onPressed: () {
                user==true
                    ? cubit.getImage(ImageSource.gallery)
                    :cubit.getDoctorImage(ImageSource.gallery);

              },
              icon: const Icon(
                  Icons.browse_gallery),
              label: const Text('gallery'),
            ),
          ],
        ),
      ],
    ),
  );
}