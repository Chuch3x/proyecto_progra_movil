import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginWaiting(userController: "", passwordController: "")) {}

  void validateInfoFirebase(auth, userController, passwordController) {
    auth
        .signInWithEmailAndPassword(
            userController.text, passwordController.text)
        .then((user) {
      if (user != null) {
        emit(LoginFailed());
      } else {
        emit(LoginSuccesful(
            userController: userController,
            passwordController: passwordController));
      }
    });
  }
}
