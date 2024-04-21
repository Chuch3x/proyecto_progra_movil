import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/login/repository/login_event.dart';
import 'package:proyecto_progra_movil/login/repository/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;

  LoginBloc({required this.loginRepo})
      : super(
            LoginWaiting(passwordController: TextEditingController(text: ""))) {
    on<LoginInput>((event, emit) async {
      emit(LoginWaiting(passwordController: TextEditingController(text: "")));
      try {
        // final token = loginRepo.loginVerification
      } catch (e) {
        emit(LoginFailed());
      }
    });
    on<LoginHuella>((event, emit) async {
      emit(LoginWaiting(passwordController: TextEditingController(text: "")));
      try {
        // token
        // faceID
        // Token
      } catch (e) {
        emit(LoginFailed());
      }
    }); //Implementar la logica de la libreria de la huella digital
  }
}
