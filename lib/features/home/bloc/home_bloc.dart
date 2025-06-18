import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init()) {
    on<InitEvent>(_init);
  }

  void _init(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith());
  }
}