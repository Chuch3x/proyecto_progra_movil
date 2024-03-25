import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterWaiting());

  void passwordValidation(pass, passValidation) {
    if (pass == passValidation) {
      emit(RegisterSuccesful());
    } else {
      emit(RegisterFailure());
    }
  }
  //Negocios logic
}
