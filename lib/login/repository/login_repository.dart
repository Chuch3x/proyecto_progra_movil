import 'package:proyecto_progra_movil/login/data_source/login_source.dart';

class LoginRepo {
  DataSource loginDataSource;

  LoginRepo({required this.loginDataSource});

  authenticateData(username, password) {
    try {
      return loginDataSource.authenticateUser(username, password);
    } catch (e) {
      throw Exception('Failed to authenticate user data: $e');
    }
  }
}
