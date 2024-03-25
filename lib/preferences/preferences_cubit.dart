import 'package:bloc/bloc.dart';

// Eventos
abstract class PreferencesEvent {}

class SelectPreference extends PreferencesEvent {
  final String preference;

  SelectPreference(this.preference);
}

// Estado
class PreferencesState {
  final List<String> selectedPreferences;

  PreferencesState(this.selectedPreferences);
}

// Cubit
class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesState([]));

  void selectPreference(String preference) {
    final List<String> updatedPreferences = List.from(state.selectedPreferences);
    if (!updatedPreferences.contains(preference)) {
      updatedPreferences.add(preference);
      emit(PreferencesState(updatedPreferences));
    }
  }
}
