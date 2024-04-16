import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterWaiting());

  void passwordValidation(pass, passValidation, auth, emailController) {
    if (pass.text == passValidation.text) {
      signUpUserFire(auth, emailController, pass);
    } else {
      emit(RegisterFailure());
    }
  } //Not useful anymore

  void signUpUserFire(auth, emailController, passwordController) {
    auth.signUpWithEmailAndPassword(
        emailController.text, passwordController.text);
  }
}
