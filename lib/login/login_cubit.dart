import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/login/repository/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginWaiting(
            emailController: new TextEditingController(text: ""),
            passwordController: new TextEditingController(text: ""))) {}

  void validateInfoFirebase(auth, userController, passwordController) {
    auth
        .signInWithEmailAndPassword(
            userController.text, passwordController.text)
        .then((user) {
      if (user != null) {
        emit(LoginSuccesful(
            emailController: userController,
            passwordController: passwordController));
      } else {
        emit(LoginFailed());
      }
    });
  }
}
