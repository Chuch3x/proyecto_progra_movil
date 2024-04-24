import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/preferences/bloc/preferences_event.dart';
import 'package:proyecto_progra_movil/preferences/bloc/preferences_state.dart';
import 'package:proyecto_progra_movil/preferences/repository/preference_repository.dart';

class PreferencesBloc extends Bloc<PreferenceEvent, PreferencesState> {
  PreferenceRepository preferenceRepository;

  PreferencesBloc({required this.preferenceRepository}) : super(PreferencesWaiting()) {
    on <TogglePreference>((event,emit){});
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
