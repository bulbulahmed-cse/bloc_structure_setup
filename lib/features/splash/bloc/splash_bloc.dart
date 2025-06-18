import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_event.dart';
import 'splash_state.dart';
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState().init()) {
    on<InitEvent>(_init);
  }

  void _init(SplashEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith());
  }
}