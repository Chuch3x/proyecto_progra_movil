import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/preferences/bloc/preferences_event.dart';
import 'package:proyecto_progra_movil/preferences/bloc/preferences_state.dart';
import 'package:proyecto_progra_movil/preferences/repository/preference_repository.dart';

class PreferencesBloc extends Bloc<PreferenceEvent, PreferencesState> {
  PreferenceRepository preferenceRepository;

  PreferencesBloc({required this.preferenceRepository}) : super(PreferencesWaiting()) {
    on<TogglePreference>((event, emit) {
      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        if (currentState.preferences.contains(event.preference)) {
          // Si la preferencia está seleccionada, la quitamos de la lista
          final updatedPreferences = List.of(currentState.preferences)
            ..remove(event.preference);
          emit(PreferencesLoaded(updatedPreferences));
        } else {
          // Si la preferencia no está seleccionada, la agregamos a la lista
          final updatedPreferences = List.of(currentState.preferences)
            ..add(event.preference);
          emit(PreferencesLoaded(updatedPreferences));
        }
      }
    });
    on<PreferencesSelected>((event, emit) async {
      try {
  
      await preferenceRepository.savePreferences(event.email, event.selectedPreferences);
      emit(PreferencesSaved());
      }
      catch (e) {
        emit(PreferencesFailure());
      }
    });
  
  }
}
