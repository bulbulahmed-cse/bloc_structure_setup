
import 'package:bloc_structure_setup/di/dependency.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/storage/shared_pref_storage_service.dart';
import '../core/storage/storage_service.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
final instance = GetIt.instance;


@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  instance.init();
  instance.allowReassignment = true;
}

@module
abstract class RegisterModule {
  @LazySingleton(as: StorageService)
  SharedPrefStorageService get sharedPrefStorageService;
}

