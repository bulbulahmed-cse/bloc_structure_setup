import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/app_routes.dart';
import '../../../routes/route_helper.dart';
import 'splash_event.dart';
import 'splash_state.dart';
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState().init()) {
    on<InitEvent>(_init);
  }

  void _init(SplashEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith());
    await Future.delayed(
        const Duration(seconds: 2),
    () async {
      RouterHelper.router.goNamed(Routes.HOME);
    });
  }
}