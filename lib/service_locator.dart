part of 'service_locator_dependecies.dart';

final sl = GetIt.instance;

Future<void> initDependecies() async {
  sl.registerSingleton<Logger>(Logger());
  _initLogin();
}

void _initLogin() {
  //network
  sl.registerSingleton<DioClient>(
    DioClient(),
  );

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
