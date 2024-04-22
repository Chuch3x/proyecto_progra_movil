import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_progra_movil/firebase_auth_implementation/firebase_auth_services.dart';

class RegDataSource {
  Future<User?> createUser(String email, String password) async {
    final FireBaseAuthService auth = FireBaseAuthService();
    try {
      final response = await auth.signUpWithEmailAndPassword(email, password);
    } catch (e) {
      throw Exception('Failed to authenticate user data: $e');
    }
  }
}
