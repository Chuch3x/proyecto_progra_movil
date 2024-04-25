import 'package:equatable/equatable.dart';

class PreferencesState extends Equatable {
  const PreferencesState();

  @override
  List<Object?> get props => [];
}

class PreferencesWaiting extends PreferencesState {}

class PreferencesLoaded extends PreferencesState {
  final List<String> preferences;

  const PreferencesLoaded(this.preferences);

  @override
  List<Object?> get props => [preferences]; // Sobrescribir props con la lista de preferencias
}

class PreferencesSaved extends PreferencesState {}

class PreferencesFailure extends PreferencesState {}


