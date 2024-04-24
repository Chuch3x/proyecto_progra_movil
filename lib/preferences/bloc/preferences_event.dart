import 'package:flutter/material.dart';

class PreferenceEvent {}

class PreferencesSelected extends PreferenceEvent {

final List<String> selectedPreferences;
final String email;

  PreferencesSelected(this.selectedPreferences,this.email);


  @override
  List<Object> get props => [email,selectedPreferences];
}
class TogglePreference extends PreferenceEvent{
  final String preference;

  TogglePreference(this.preference);

  @override
  List<Object?> get props => [preference];
}