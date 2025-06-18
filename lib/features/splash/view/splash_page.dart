import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
    const SplashPage({super.key});

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
           create: (BuildContext context) => SplashBloc()..add(InitEvent()),
           child: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                    return _buildPage(context);
                },
            ),
        );
    }

    Widget _buildPage(BuildContext context) {
        final bloc = BlocProvider.of<SplashBloc>(context);
        return Container();
    }
}