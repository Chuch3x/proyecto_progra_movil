import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:proyecto_progra_movil/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterWaiting());

  void passwordValidation(pass, passValidation, emailController) {
    if (pass.text == passValidation.text) {
      signUpUserFire(emailController, pass);
    } else {
      emit(RegisterFailure());
    }
  }

  void signUpUserFire(emailController, passwordController) async {
    final FireBaseAuthService auth = FireBaseAuthService();
    try {
      final User? user = await auth.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      if (user != null) {
        emit(RegisterSuccesful());
      } else {
        emit(RegisterFailure());
      }
    } catch (e) {
      emit(RegisterFailure());
    }
  }
}
