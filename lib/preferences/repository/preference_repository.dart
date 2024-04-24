import 'dart:core';

import 'package:proyecto_progra_movil/preferences/data_source/preference_source.dart';

class PreferenceRepository{
  PreferencesData preferencesData ;
  PreferenceRepository({required this.preferencesData});
  Future <void> savePreferences(
    String email,
    List<String> preferences,
  ) async {
      await preferencesData.savePreferences(email, preferences);
  }

}