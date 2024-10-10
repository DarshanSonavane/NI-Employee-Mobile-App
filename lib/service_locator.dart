part of 'service_locator_dependecies.dart';

final sl = GetIt.instance;

Future<void> initDependecies() async {
  sl.registerSingleton<Logger>(Logger());
  final hiveInitService = HiveService();
  await hiveInitService.init();

  _initDioClient();
  _initLogin();
  _initSetResetPassword();
  _initHiveService();
}

void _initHiveService() {
  sl.registerLazySingleton<HiveStorageService>(() => HiveStorageService());
}

void _initDioClient() {
  // Register DioClient once, as it is used in both features
  sl.registerSingleton<DioClient>(
    DioClient(),
  );
}

void _initLogin() {
  //service
  sl.registerSingleton<LoginApiService>(
    LoginApiServiceImpl(),
  );

  //Repository
  sl.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(),
  );

  //UseCase
  sl.registerSingleton<UserLogin>(
    UserLogin(),
  );

  //Bloc
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(userLogin: sl()),
  );
}

void _initSetResetPassword() {
  //Repository
  sl.registerSingleton<SetResetPasswordRepository>(
    SetResetPasswordRepositoryImpl(),
  );

  //service
  sl.registerSingleton<SetResetPasswordService>(
    SetResetPasswordServiceImpl(),
  );

  //UseCase
  sl.registerSingleton<SetResetPasswordUsecase>(
    SetResetPasswordUsecase(),
  );

  //Bloc
  sl.registerFactory<SetResetPasswordBloc>(
    () => SetResetPasswordBloc(setResetPasswordUsecase: sl()),
  );
}
