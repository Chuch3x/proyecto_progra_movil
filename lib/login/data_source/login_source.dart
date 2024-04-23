import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_progra_movil/firebase_auth_implementation/firebase_auth_services.dart';

class DataSource {
  Future<User?> authenticateUser(String username, String password) async {
    final FireBaseAuthService auth = FireBaseAuthService();
    try {
      final response =
          await auth.signInWithEmailAndPassword(username, password);
    } catch (e) {
      throw Exception('Failed to authenticate user data: $e');
    }
  }
}
