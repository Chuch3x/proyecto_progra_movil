import 'package:flutter/widgets.dart';

class PreferencesState {
  PreferencesState();
}

class PreferencesWaiting extends PreferencesState {}

class PreferencesLoaded extends PreferencesState {
  
  final List<String> preferences;

  PreferencesLoaded(this.preferences);

  @override
  List<Object?> get props => [preferences];
}
class PreferencesSaved extends PreferencesState{}
class PreferencesFailure extends PreferencesState{}
