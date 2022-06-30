import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant.dart';
import '../../../network_helper/cubit/networkCubit.dart';
import '../../../network_helper/cubit/networlStates.dart';
import '../../../shared/sharedComponent.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);


  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {

          NetworkCubit cubit = NetworkCubit.get(context);

          SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(statusBarColor: Colors.white));
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  'Edit Profile',
                  style: text20ForNameAdd,
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      cubit.editPatientProfileAPI();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
              body: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //remove const when using api
                        children: [
                          cubit.patientProfileImage == null
                              ? const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://www2.deloitte.com/content/dam/Deloitte/xe/Images/promo_images/'
                                          'profilepictures/Joerg-Meiser.jpg/_jcr_content/renditions/cq5dam.web.250.250.mobile.jpeg'))
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      FileImage(cubit.patientProfileImage!)),
                          InkWell(
                            child: Text(
                              'Change Photo',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor),
                            ),
                            onTap: () {
                              // cubit.getImage();
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => ImageProfileBottomSheet(cubit,true)),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    //const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 15, top: 5, right: 15, bottom: 10),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EditProfileTextField(
                              label: 'Name',
                              controller: cubit.editNameController,
                              secure: false,
                            ),

                            EditProfileTextField(
                              label: 'E-Mail',
                              type: TextInputType.emailAddress,
                              controller: cubit.editEmailController,
                              secure: false,
                            ),

                            EditProfileTextField(
                              label: 'Date Of Birth',
                              type: TextInputType.datetime,
                              controller: cubit.editDateOfBirthController,
                              secure: false,
                            ),

                            EditProfileTextField(
                              label: 'Height',
                              type: TextInputType.number,
                              controller: cubit.editHeightController,
                              secure: false,
                            ),

                            EditProfileTextField(
                              label: 'Weight',
                              type: TextInputType.number,
                              controller: cubit.editWeightController,
                              secure: false,
                            ),

                            EditProfileTextField(
                              label: 'Blood Type',
                              controller: cubit.editBloodTypeController,
                              secure: false,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          );
        });
  }
}

class EditProfileTextField extends StatelessWidget {
  EditProfileTextField(
      {Key? key,
      required this.label,
      this.type,
      this.controller,
      this.validator,
      required this.secure});
  final String label;
  final TextInputType? type;
  final controller;
  final validator;
  bool secure = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: type,
        obscureText: secure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide.none,
          ),
          fillColor: whiteColor,
          filled: true,
          errorStyle: const TextStyle(height: .8, color: Colors.red),
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}

/* class BottomSheet extends StatefulWidget {
//   const BottomSheet({Key? key}) : super(key: key);
//
//   @override
//   State<BottomSheet> createState() => _BottomSheetState();
// }
//
// class _BottomSheetState extends State<BottomSheet> {
//   File? profileImage;
//
//
//   //final ImagePicker picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//       child: Column(
//         children: [
//           const Text('choose profile photo',style: TextStyle(fontSize: 20),),
//           const SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton.icon(onPressed: (){setState(() {
//                 getImage(ImageSource.camera);
//               });
//
//               }, icon: const Icon(Icons.camera), label: const Text('camera'),),
//               TextButton.icon(onPressed: (){
//                 setState(() {
//                   getImage(ImageSource.gallery);
//                 });
//               }, icon: const Icon(Icons.browse_gallery),
//                 label: const Text('gallery'),),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future <void>getImage(ImageSource source)async{
//     final pickedFile = await ImagePicker.platform.pickImage(source: source);
//     if(pickedFile !=null)
//     {
//       profileImage=File(pickedFile.path);
//       print(pickedFile.path);
//     }
//     else
//     {
//       print("nothing selected");
//     }
//   }
//
//
//   // void takePhoto(ImageSource source)async{
//   //   final pickedFile = await picker.getImage(source: source);
//   //   setState(() {
//   //     file = pickedFile! ;
//   //   });
//   // }
// }*/


