import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../Blocs/featureBloc/featureStates.dart';
import '../../../Blocs/featureBloc/featurecubit.dart';
import '../../../constant.dart';
import '../../../shared/sharedComponent.dart';


class AddMedicalVisits extends StatefulWidget {

  static String idAddMedicalVisit = "idAddMedicalVisit";
  @override
  State<AddMedicalVisits> createState() => _AddMedicalVisitsState();
}
class _AddMedicalVisitsState extends State<AddMedicalVisits> {
  List<Widget> _textFieldList = [];
  List <TextEditingController>_textFieldControllers = [];
  void _addTextField(){
    setState(() {
      _textFieldControllers.add(TextEditingController());
      for (var controller in _textFieldControllers) {
        var indx = 0;
        _textFieldList.insert(indx,_textField(controller: controller));
        indx=indx+1;
      }

    });
  }
  //Future status ( bool status)async {

  //   await status
  //       ? showToast(msg: "sent successfully", states: ToastStates.SUCCESS)
  //       : showMyDialog(context);
  // }
    @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureStates>(
        listener: (context, states) {},
        builder: (context, states) {
          FeatureCubit cubit = FeatureCubit.get(context);
          return Scaffold(
            backgroundColor:Colors.white ,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title:  Center(
                child: Text(
                  " Add Medical Visit",
                  style: textTitle22Style,
                ),
              ),
            ),
            body: Form(key: cubit.formkey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Prescription",
                          style: text20ForNameAdd,),
                        Padding(padding: const EdgeInsets.fromLTRB(35, 24, 35, 24),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  iconSize: 35.0,
                                  onPressed: () {
                                    cubit.takePhoto(ImageSource.gallery).then(
                                        (value) => cubit.imageOfPrescription =
                                            value as TextEditingController);
                                  },
                                ),
                                const Text("Upload Image"),
                              ],
                            ),
                          ),
                        ),
                        TextAndField(
                          ontap: () {},
                          text: "Summary",
                          controller: cubit.summaryController,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('active substance',style: text20ForNameAdd,),
                            IconButton(onPressed: (){
                              _addTextField();
                            }, icon: Icon(Icons.add),
                            )
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _textFieldControllers.length,
                            itemBuilder: (context, index) {
                          return _textFieldList[index];
                        }),

                        TextAndField(
                          ontap: () {},
                          text: "Notes",
                          controller: cubit.notesController,
                        ),
                        TextAndField(
                          ontap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2020),
                              lastDate: DateTime.utc(2025),
                            ).then((value) {
                              cubit.medicalVisitDateController.text =
                                  DateFormat('yyyy-MM-dd').format(value!);

                            });
                          },
                          text: "Date",
                          controller: cubit.medicalVisitDateController,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            saveBotton(onpressed: () {
                              if (cubit.formkey.currentState!.validate()) {
                                cubit.docMedicalVisitModelAPI(patientId);
                                print(_textFieldControllers.first.text);


                                for(int i= 0 ;i<_textFieldControllers.length;i++) {

                                  cubit.activeSubstanceAPI(
                                    context,
                                    patientId,
                                    _textFieldControllers[i].text,
                                  );
                                }
                                // showToast(msg: "sent successfully", states: ToastStates.SUCCESS);
                                 //    Navigator.pop(context);
                                 //    cubit.summaryController.clear();
                                 //     cubit.notesController.clear();
                                 //      cubit.medicalVisitDateController.clear();
                                 //          for(TextEditingController controller in _textFieldControllers){
                                 //                   controller.clear();
                                 //          };

                               // status( cubit.status);
                                //  ?showToast(msg: "sent successfully", states: ToastStates.SUCCESS)
                                // :showMyDialog(context) ;

                             //   Navigator.pop(context);
                              cubit.summaryController.clear();
                              cubit.notesController.clear();
                              cubit.medicalVisitDateController.clear();
                              for(TextEditingController controller in _textFieldControllers){
                              controller.clear();}
                              }
                            }),
                            const SizedBox(
                              width: 16.0,
                            ),
                            cancelBotton(onpressed: () {
                             cubit.deletePrescriptionID(patientId);
                             Navigator.pop(context);
                            })
                          ],
                        )
                      ]),
                ),
              ),
            ),
          );
        });


  }
  Widget _textField({
  required TextEditingController controller,
}){

    return Container(

      child: Expanded(
        child: TextFormField(
            onTap:() {},
            cursorHeight: 20,
            controller: controller,
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.isEmpty) {
                return "please add active substance";
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
      ),
    );
  }


}
