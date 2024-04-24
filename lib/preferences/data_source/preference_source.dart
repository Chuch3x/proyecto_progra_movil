import 'package:proyecto_progra_movil/firebase_auth_implementation/firebase_firestore.dart';
class PreferencesData{
  Future<void> savePreferences(
      String email,List<String> preferences) async {
    final FireStore DB = FireStore();
      try {
        await DB.uploadPreferences(email, preferences);
      } catch (e) {
        throw Exception("couldn't upload preferences found ${e.toString()}");
      }
    
  }
}