import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/login/bloc/login_event.dart';
import 'package:proyecto_progra_movil/login/bloc/login_state.dart';
import 'package:proyecto_progra_movil/login/repository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;

  LoginBloc({required this.loginRepo}) : super(LoginWaiting()) {
    on<LoginInput>((event, emit) async {
      try {
        final validation =
            loginRepo.authenticateData(event.email, event.password);
        if (validation) {
          emit(LoginSuccesful(email: event.email));
        }
      } catch (e) {
        emit(LoginFailed());
      }
    });
    on<LoginHuella>((event, emit) async {
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
