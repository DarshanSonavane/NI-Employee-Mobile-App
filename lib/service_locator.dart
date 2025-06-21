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
  _initDashBoardDetails();
  _initGetComplaintList();
  _initGetCalibrationList();
  _initGetProfileData();
  _initGetAssignedProductList();
  _initAssignProductFromMasterInventory();
  _initFSRScreen();
  _initMasterInventory();
  _initAddEmployee();
  _initDeleteEmployee();
}

void _initMasterInventory() {
  sl.registerSingleton<UpdateProductsInventoryService>(
    UpdateProductsInventoryServiceImpl(),
  );
  //Repository
  sl.registerSingleton<InsertUpdateProductRepository>(
    InsertUpdateProductRepositoryImpl(),
  );

  //UseCases
  sl.registerSingleton<InsertUpdateProductUsecase>(
    InsertUpdateProductUsecase(),
  );

  sl.registerFactory<MasterInventoryBloc>(
    () => MasterInventoryBloc(
      fetchMasterInventoryUsecase: sl(),
      insertUpdateProductUsecase: sl(),
    ),
  );
}

void _initFSRScreen() {
  //service
  sl.registerSingleton<CreateFSRService>(
    CreateFSRServiceImpl(),
  );

  sl.registerSingleton<SendOtpService>(
    SendOtpServiceImpl(),
  );

  sl.registerSingleton<SendVerificationService>(
    SendVerificationServiceImpl(),
  );

  //Repository
  sl.registerSingleton<SendOTPRepository>(
    SendOTPRepositoryImpl(),
  );

  sl.registerSingleton<SendRequestForCreateFSRRepository>(
    CreateFsrRepositoryImpl(),
  );

  sl.registerSingleton<SendVerificationRepository>(
    SendVerificationRepositoryImpl(),
  );

  //UseCases
  sl.registerSingleton<CreateFSRUsecase>(
    CreateFSRUsecase(),
  );

  sl.registerSingleton<SendOtpUsecase>(
    SendOtpUsecase(),
  );

  sl.registerSingleton<SendVerificationUsecase>(
    SendVerificationUsecase(),
  );

  //Bloc
  sl.registerFactory<FsrBloc>(
    () => FsrBloc(
      sendVerificationCodeUsecase: sl(),
      sendOTPUsecase: sl(),
      createFsrUsecase: sl(),
    ),
  );
}

void _initAssignProductFromMasterInventory() {
  //service
  sl.registerSingleton<GetMasterInventoryApiService>(
    GetMasterInventoryApiServiceImpl(),
  );

  sl.registerSingleton<AssignProductToEmpService>(
    AssignProductToEmpServiceImpl(),
  );

  //Repository
  sl.registerSingleton<FetchMasterInventoryRepository>(
    FetchMasterInventoryRepositoryImpl(),
  );

  sl.registerSingleton<ProductAssigmentRepository>(
    ProductAssignRepoImpl(),
  );

  //UseCases
  sl.registerSingleton<FetchMasterInventoryUsecase>(
    FetchMasterInventoryUsecase(),
  );

  sl.registerSingleton<AssignProductToEmpUsecase>(
    AssignProductToEmpUsecase(),
  );

  //Bloc
  sl.registerFactory<AssignProductToEmployeeBloc>(
    () => AssignProductToEmployeeBloc(
      fetchMasterInventoryUsecase: sl(),
      fetchEmployeeData: sl(),
      assignProductToEmpUseCase: sl(),
    ),
  );
}

void _initDashBoardDetails() {
  //Service
  sl.registerSingleton<GetHomeDetailsApiService>(
    GetHomeDetailsApiServiceImpl(),
  );
  sl.registerSingleton<FetchFsrListService>(
    FetchFsrListServiceImpl(),
  );

  //Repository
  sl.registerSingleton<FetchHomeRepository>(
    FetchDashboardDataRepositoryImpl(),
  );

  sl.registerSingleton<RegisteredFsrRepository>(
    FetchFsrRepositoryImpl(),
  );

  //UseCases
  sl.registerSingleton<FetchHomeData>(
    FetchHomeData(),
  );
  sl.registerSingleton<FetchFsrUsecase>(
    FetchFsrUsecase(),
  );

  sl.registerFactory<HomeBloc>(
    () => HomeBloc(
      fetchHomeData: sl(),
      fetchFSRListUsecase: sl(),
    ),
  );
}

void _initHiveService() {
  sl.registerLazySingleton<HiveStorageService>(() => HiveStorageService());
}

void _initDioClient() {
  sl.registerSingleton<DioClient>(
    DioClient(),
  );
}

void _initGetAssignedProductList() {
  //service
  sl.registerSingleton<FetchEmployeeAssignedProductsService>(
    FetchEmployeeAssignedProductsServiceImpl(),
  );

  //Repository
  sl.registerSingleton<EmpProductRepository>(
    EmpProductRepositoryImpl(),
  );

  //UseCases
  sl.registerSingleton<FetchEmpAssignedProductUsecase>(
    FetchEmpAssignedProductUsecase(),
  );

  //Bloc
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(fetchEmpAssignedProductUsecase: sl()),
  );
}

void _initGetCalibrationList() {
  //service
  sl.registerSingleton<GetCalibrationDetailApiService>(
    GetCalibrationDetailsApiServiceImpl(),
  );
  sl.registerSingleton<GetCylinderDetailsApiService>(
    GetCylinderDetailsApiServiceImpl(),
  );
  sl.registerSingleton<UpdateCylinderDetailsApiService>(
    UpdateCylinderDetailsApiServiceImpl(),
  );
  sl.registerSingleton<DeleteCalibrationItemApiService>(
    DeleteCalibrationItemApiServiceImpl(),
  );
  sl.registerSingleton<GenerateAndSendCalibrationItemApiService>(
    GenerateAndSendCalibrationItemApiServiceImpl(),
  );
  sl.registerSingleton<AddMachineDetailsApiService>(
    AddMachineDetailsApiServiceImpl(),
  );

  //Repository
  sl.registerSingleton<FetchCalibrationRepository>(
    FetchCalibrationRepositoryImpl(),
  );
  sl.registerSingleton<FetchCylinderDetailsRepository>(
    FetchCylinderRepositoryImpl(),
  );
  sl.registerSingleton<UpdateCylinderDetailsRepository>(
    UpdateCylinderDetailsRepositoryImpl(),
  );
  sl.registerSingleton<DeleteCalibrationItemRepository>(
    DeleteCalibrationItemRepositoryImpl(),
  );
  sl.registerSingleton<GenerateAndSendCalibrationRepository>(
    GenerateAndSendCalibrationRepositoryImpl(),
  );
  sl.registerSingleton<AddMachineDetailsRepository>(
    AddMachineRespositoryImpl(),
  );
  //UseCases
  sl.registerSingleton<FetchCalibrationData>(
    FetchCalibrationData(),
  );
  sl.registerSingleton<FetchCylinderDetails>(
    FetchCylinderDetails(),
  );
  sl.registerSingleton<UpdateCylinderDetailsUseCase>(
    UpdateCylinderDetailsUseCase(),
  );
  sl.registerSingleton<DeleteCalibrationUsecase>(
    DeleteCalibrationUsecase(),
  );
  sl.registerSingleton<GenerateAndSendCalibrationUsecase>(
    GenerateAndSendCalibrationUsecase(),
  );
  sl.registerSingleton<AddMachineDetailsUsecase>(
    AddMachineDetailsUsecase(),
  );

  //Bloc
  sl.registerFactory<CalibrationBloc>(() => CalibrationBloc(
        fetchCalibrationData: sl(),
        fetchCylinderDetails: sl(),
        updateCylinderDetailsUseCase: sl(),
        deleteCalibrationUsecase: sl(),
        generateAndSendCalibrationUsecase: sl(),
        addMachineDetailsUseCase: sl(),
      ));
}

void _initGetComplaintList() {
  //service
  sl.registerSingleton<GetComplaintDetailApiService>(
    GetComplaintDetailsApiServiceImpl(),
  );
  sl.registerSingleton<CloseComplaintItemApiService>(
    CloseComplaintItemApiServiceImpl(),
  );
  sl.registerSingleton<GetEmployeeDetailApiService>(
    GetEmployeeDetailsApiServiceImpl(),
  );

  //Repository
  sl.registerSingleton<FetchComplaintRepository>(
    FetchComplaintRepositoryImpl(),
  );
  sl.registerSingleton<CloseComplaintRepository>(
    CloseComplaintRepositoryImpl(),
  );
  sl.registerSingleton<FetchEmployeeRepository>(
    FetchEmployeeRepositoryImpl(),
  );
  //UseCases
  sl.registerSingleton<FetchComplaintData>(
    FetchComplaintData(),
  );
  sl.registerSingleton<CloseComplaintData>(
    CloseComplaintData(),
  );
  sl.registerSingleton<FetchEmployeeData>(
    FetchEmployeeData(),
  );

  //Bloc
  sl.registerFactory<ComplaintBloc>(
    () => ComplaintBloc(
      fetchComplaintData: sl(),
      closeComplaintData: sl(),
      fetchEmployeeData: sl(),
    ),
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

void _initGetProfileData() {
  sl
    //service
    ..registerLazySingleton<EmployeeProfileDetailsService>(
        () => EmployeeProfileDetailsServiceImpl())
    //Repository
    ..registerLazySingleton<EmployeeProfileRepository>(
        () => EmployeeProfileRepositoryImpl())
    //UseCase
    ..registerLazySingleton<FetchEmployeeProfileUsecase>(
        () => FetchEmployeeProfileUsecase())
    //Bloc
    ..registerFactory<ProfileBloc>(() => ProfileBloc(
          fetchEmployeeProfileUseCase: sl(),
        ));
}

void _initAddEmployee() {
  sl
    //service
    ..registerLazySingleton<CreateEmployeeService>(
        () => CreateEmployeeServiceImpl())
    //Repository
    ..registerLazySingleton<AddEmployeeRepository>(() => AddEmpRepostioryImpl())
    //UseCase
    ..registerLazySingleton<AddEmployeeUsecase>(() => AddEmployeeUsecase())
    //Bloc
    ..registerFactory<AddEmployeeBloc>(() => AddEmployeeBloc(
          addEmployeeUsecase: sl(),
        ));
}

void _initDeleteEmployee() {
  sl
    //service
    ..registerLazySingleton<DeleteEmployeeService>(
        () => DeleteEmployeeServiceImpl())
    //Repository
    ..registerLazySingleton<DeleteEmployeeProfileRepository>(
        () => DeleteEmployeeProfileRepositoryImpl())
    //UseCase
    ..registerLazySingleton<DeleteProfileUsecase>(() => DeleteProfileUsecase())
    //Bloc
    ..registerFactory<EmployeeProfileBloc>(() => EmployeeProfileBloc(
          deleteEmployeeUsecase: sl(),
        ));
}
