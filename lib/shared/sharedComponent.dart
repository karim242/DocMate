import 'package:docmate/patient%20route/homePage/homePage.dart';
import 'package:docmate/patient%20route/medicalProfile.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constant.dart';


MaterialButton latestNewsSilder(context, articles) {

    return MaterialButton(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 1.25,
            height: MediaQuery
                .of(context)
                .size
                .height / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('${articles['urlToImage']}')),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 1.2,
            height: MediaQuery
                .of(context)
                .size
                .height / 16,
            child: Center(
              child: Text(
                '${articles['title']}',
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
  required VoidCallback onpressed,
}) {
  return MaterialButton(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    onPressed: () {},
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
                image: NetworkImage('${articles['urlToImage']}')),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 20,
          child: Center(
            child: Text(
              '${articles['title']}',
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

CarouselSlider carouselSlider(context, articles,) {
  return CarouselSlider.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return
          ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: MediaQuery.of(context).size.height /4.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${articles[index]['urlToImage']}')),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width / 1.2,
                //   height: MediaQuery.of(context).size.height / 16,

                   // child:
                Text(
                      '${articles[index]['title']}',
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
          ),);
}


ListTile TitleInDrawer(
    {
      required IconData icons,
      required String text,
      required VoidCallback ontap,
    }
    ) {
  return ListTile(
    leading:  Icon(icons,size: 32,),
    title:  Text(text,
      style: const TextStyle(fontSize: 18,
          fontWeight: FontWeight.w500,),),
    onTap: ontap,
  );
}

class MyBottomNavBar extends StatefulWidget {
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  Color iconColor =  Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFDF8FF),
      height: MediaQuery.of(context).size.height / 9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget> [
              IconButton(onPressed: (){
                setState(() {
                  Navigator.pushReplacementNamed(context, HomePageScreen.homePageID);
                  iconColor=Colors.blue;
                });
              }, icon: Icon(Icons.home,size: 30,color: iconColor,)),
              const Text('Home',style: TextStyle(fontSize: 13),),

            ],
          ),
          Column(
            children: <Widget> [
              IconButton(onPressed: (){
                setState(() {
                  Navigator.pushNamed(context, MedicalProfileScreen.medicalProfileID);
                });
              }, icon: Icon(Icons.note_add_outlined,size: 30,color: iconColor,)),
              const Text('Medical Profile',style: TextStyle(fontSize: 13),),

            ],
          ),
          Column(
            children: <Widget> [
              IconButton(onPressed: (){
                setState(() {
                  Navigator.pushReplacementNamed(context, HomePageScreen.homePageID);
                });
              }, icon: Icon(Icons.person_sharp,size: 30,color: iconColor,)),
              const Text('Profile',style: TextStyle(fontSize: 13),),

            ],
          )
        ],
      ),
    );
  }
}



Padding FeatureCard({
 // required IconData icon,
  required String text,
  required Color color
}) {
  return Padding(
    padding: const EdgeInsets.all(13.0),
    child: MaterialButton(
      onPressed: () {},
      elevation: 10,
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
            width:30.5,height: 70.0,
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