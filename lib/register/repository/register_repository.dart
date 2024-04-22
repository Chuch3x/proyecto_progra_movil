import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_progra_movil/register/data_source/register_data_source.dart';

class RegisterRepo {
  RegDataSource dataSource;

  RegisterRepo({required this.dataSource});

  Future<User?> passwordValidation(
      pass, passValidation, emailController) async {
    if (pass == passValidation) {
      return dataSource.createUser(emailController, pass);
    }
  }
}
