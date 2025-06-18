// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../app_controller_bloc.dart' as _i316;
import '../core/storage/shared_pref_storage_service.dart' as _i520;
import '../core/storage/storage_service.dart' as _i468;
import '../repositories/splash_repository.dart' as _i563;
import '../services/api_service/dio_client.dart' as _i52;
import 'dependency.dart' as _i396;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i316.AppControllerBloc>(() => _i316.AppControllerBloc());
    gh.factory<_i52.DioClient>(() => _i52.DioClient());
    gh.factory<_i563.SplashRepository>(
      () => _i563.SplashRepository(dioClient: gh<_i52.DioClient>()),
    );
    gh.lazySingleton<_i468.StorageService>(
      () => registerModule.sharedPrefStorageService,
    );
    return this;
  }
}

class _$RegisterModule extends _i396.RegisterModule {
  @override
  _i520.SharedPrefStorageService get sharedPrefStorageService =>
      _i520.SharedPrefStorageService();
}
