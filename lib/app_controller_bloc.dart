import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../di/dependency.dart';
import 'app_controller_event.dart';
import 'app_controller_state.dart';
import 'core/storage/storage_service.dart';
import 'core/utils/connnectivity_helper.dart';

@injectable
class AppControllerBloc extends Bloc<AppControllerEvent, AppControllerState> {
  ConnectivityHelper connectivityHelper = ConnectivityHelper();
  AppControllerBloc() : super(AppControllerState()..inti()){
    on<InitAppEvent>(init);
    on<ChangeLanguage>(changeLanguage);
    on<ChangeIgnoresSafeArea>(changeIgnoresSafeArea);
  }

  Future<void> init(InitAppEvent event, Emitter<AppControllerState> emit,) async {
    state.inti();
  }

  Future<void> changeLanguage(ChangeLanguage event, Emitter<AppControllerState> emit,) async {
    if(state.supportedLocales.contains(Locale(event.locale.languageCode))){
      instance<StorageService>().setLanguage(event.locale.languageCode);
      emit(state.copyWith(locale:event.locale));
    }
  }

  Future<void> changeIgnoresSafeArea(ChangeIgnoresSafeArea event, Emitter<AppControllerState> emit,) async {
    emit(state.copyWith(isIgnore: event.ignoreSafeArea));
  }

}
