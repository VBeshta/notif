part of 'package:notif/core/app.dart';

Future<void> setupServiceLocator() async {
  _setupSyncDeps();
  await _setupAsyncDeps();
}

void _setupSyncDeps() {
  _getIt.registerSingleton<Spacings>(Spacings());

  _getIt.registerSingleton<Logger>(Logger());
  _getIt.registerSingleton<CompositeLogger>(
    CompositeLoggerImpl(logger: _getLogger),
  );
  _getIt.registerSingleton<AppRouter>(GoAppRouter());

  _getIt.registerSingleton<Dio>(Dio());
  _getIt.registerSingleton<NetworkService>(DioNetworkServiceImpl(_getDio));
}

Future<void> _setupAsyncDeps() async {
  _getIt.registerSingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );
  _getIt.registerSingletonAsync<LocalStorageService>(
    dependsOn: [SharedPreferences],
    () async => SharedPrefsStorageService(
      sharedPreferences: _getSharedPreferences,
    ),
  );
}
