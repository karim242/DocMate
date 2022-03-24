import 'package:bloc/bloc.dart';
import 'package:docmate/Blocs/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(InitStates());

  static UserCubit get(context){
    return BlocProvider.of(context);
  }  //object from him self




 }
