import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/register/bloc/register_event.dart';
import 'package:proyecto_progra_movil/register/bloc/register_state.dart';
import 'package:proyecto_progra_movil/register/repository/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepo registerRepo;

  RegisterBloc({required this.registerRepo}) : super(RegisterWaiting()) {
    on<RegisterSave>((event, emit) async {
      try {
        final user = registerRepo.passwordValidation(
            event.password, event.passwordValidation, event.email);
        if (user != null) {
          emit(RegisterSuccesful());
        } else {
          emit(RegisterFailure());
        }
      } catch (e) {
        emit(RegisterFailure());
      }
    });
  }
}
