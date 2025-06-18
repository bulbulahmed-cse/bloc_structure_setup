import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
           create: (BuildContext context) => HomeBloc()..add(InitEvent()),
           child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                    return _buildPage(context);
                },
            ),
        );
    }

    Widget _buildPage(BuildContext context) {
        final bloc = BlocProvider.of<HomeBloc>(context);
        return Scaffold(
          body: Center(
            child: Text("Welcome to the Home Page!"),
          ),
        );
    }
}