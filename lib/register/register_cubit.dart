import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterWaiting());

  void validateRegisterData(formkey, pass, passVal) {
    final FormState form = formkey.currentState;
    if (form.validate()) {
      print(form.toString());
    } else {
      emit(RegisterSuccesful());
    }
  }

  void passwordValidation(pass, passValidation) {
    if (pass == passValidation) {
      emit(RegisterSuccesful());
    } else {
      emit(RegisterFailure());
    }
  }
  //Negocios logic
}
