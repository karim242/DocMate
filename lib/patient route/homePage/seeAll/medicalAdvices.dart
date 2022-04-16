import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant.dart';
import '../../../network_helper/cubit/networkCubit.dart';
import '../../../network_helper/cubit/networlStates.dart';
import '../../../shared/sharedComponent.dart';

class MedicalAdvices extends StatelessWidget {
  const MedicalAdvices({Key? key}) : super(key: key);
  static String medicalAdvicesId = "medicalAdvicesId";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NetworkCubit()..getLatestNews(),
      child: BlocConsumer<NetworkCubit, NetworkStates>(
          listener: (context, states) {},
          builder: (context, states) {
            var cubit = NetworkCubit.get(context);
            dynamic data = cubit.latestNew;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  "Medical Advices",
                  style: textTitle22Style,
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  color: Colors.black,
                  iconSize: 30,
                ),
              ),
              body:  ConditionalBuilder(
                condition: states is ! NetworkLoadingStates,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (BuildContext context, int index)
                          =>   medicalAdvices(context,
                              articles: data,
                              index: index
                          ),
                          itemCount: 16,

                        ),
                      )
                    ],
                  ),
                ),
                fallback: (BuildContext context) {
                  return const Center(child: CircularProgressIndicator(),) ;
                },
              ),
            );
          }),
    );
  }
}
