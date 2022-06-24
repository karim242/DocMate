import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constant.dart';
import '../../../../network_helper/cubit/networkCubit.dart';
import '../../../../network_helper/cubit/networlStates.dart';
import '../../../shared/sharedComponent.dart';

class EditDoctorProfile extends StatefulWidget {
  const EditDoctorProfile({Key? key}) : super(key: key);

  @override
  State<EditDoctorProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditDoctorProfile> {
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
                     cubit.editDocProfileAPI();
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
                          cubit.doctorProfileImage == null
                              ? const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/140x100'))
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      FileImage(cubit.doctorProfileImage!),
                                ),
                          InkWell(
                            child: Text(
                              'Change Photo',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) =>
                                      ImageProfileBottomSheet(cubit, false)));
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 15, top: 10, right: 15, bottom: 10),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EditProfileTextField(
                              label: 'ID',
                              type: TextInputType.number,
                              controller: cubit.editDoctorIDController,
                            ),
                            // SizedBox(height:5),
                            EditProfileTextField(
                              label: 'name',
                              type: TextInputType.text,
                              controller: cubit.editDoctorNameController,
                            ),
                            // const SizedBox(height: 10,),
                            EditProfileTextField(
                              label: 'E-mail',
                              type: TextInputType.emailAddress,
                              controller: cubit.editDoctorEmailController,
                            ),
                            // const SizedBox(height: 10,)
                            EditProfileTextField(
                              label: 'department',
                              type: TextInputType.text,
                              controller: cubit.editDoctorDepartmentController,
                            )
                            // const SizedBox(height: 10,)
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
  const EditProfileTextField(
      {Key? key,
      required this.label,
      this.type,
      this.controller,
      this.validator})
      : super(key: key);
  final String label;
  final TextInputType? type;
  final controller;
  final validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: type,
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
/*
class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  late PickedFile file;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Column(
        children: [
          const Text('choose profile photo',style: TextStyle(fontSize: 20),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(onPressed: (){setState(() {
                takePhoto(ImageSource.camera);
              });

              }, icon: const Icon(Icons.camera), label: const Text('camera'),),
              TextButton.icon(onPressed: (){
                setState(() {
                  takePhoto(ImageSource.gallery);
                });
              }, icon: const Icon(Icons.browse_gallery),
                label: const Text('gallery'),),
            ],
          ),
        ],
      ),
    );
  }
  void takePhoto(ImageSource source)async{
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      file = pickedFile! ;
    });
  }
}
*/
