import 'package:bloc_structure_setup/app_controller_state.dart';
import 'package:bloc_structure_setup/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_controller_bloc.dart';
import 'core/constants/constants.dart';
import 'core/observer/app_bloc_observer.dart';
import 'core/theme/app_themes.dart';
import 'di/dependency.dart';
import 'l10n/app_localizations.dart';

BuildContext get appContext => RouterHelper.router.routerDelegate.navigatorKey.currentContext!;

AppLocalizations appLanguage([BuildContext? context]) => AppLocalizations.of(context ?? appContext)!;

ThemeData appTheme([BuildContext? context]) => Theme.of(context ?? appContext);

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: BlocBuilder<AppControllerBloc, AppControllerState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: AppConstant.defaultScreenSize,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return IgnorePointer(
                ignoring: context
                    .read<AppControllerBloc>()
                    .state
                    .isIgnore ?? false,
                child: MaterialApp.router(
                  scaffoldMessengerKey: scaffoldMessengerKey,
                  routerConfig: RouterHelper.router,
                  title: 'Bloc SetUp',
                  debugShowCheckedModeBanner: false,
                  theme: AppThemes.light,
                  darkTheme: AppThemes.light,
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
