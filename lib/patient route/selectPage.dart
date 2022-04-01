import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network_helper/cubit/networkCubit.dart';
import '../network_helper/cubit/networlStates.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkCubit, NetworkStates>(
        listener: (context, states) {},
        builder: (context, states) {
          NetworkCubit cubit = NetworkCubit.get(context);

          return Scaffold(
            body: ConditionalBuilder(
              condition: states is! NetworkLoadingStates,
              builder: (BuildContext context) {
                return cubit.screens[cubit.selectedIndex];
              },
              fallback: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.selectedIndex,
                items: cubit.navList,
                onTap: (index) {
                  cubit.changenav(index);
                }),
          );
        });
  }
}
