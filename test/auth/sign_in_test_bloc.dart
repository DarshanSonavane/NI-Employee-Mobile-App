import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/error/failure.dart';
import 'package:employee_ni_service/features/auth/data/models/login_request_params.dart';
import 'package:employee_ni_service/features/auth/data/models/login_response_params.dart';
import 'package:employee_ni_service/features/auth/domain/usecases/user_login.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_test_bloc.mocks.dart';

@GenerateMocks([UserLogin])
void main() {
  late SignInBloc signInBloc;
  late MockUserLogin mockUserLogin;

  setUp(() {
    mockUserLogin = MockUserLogin();
    signInBloc = SignInBloc(userLogin: mockUserLogin);
  });

  final loginRequest = LoginRequestParams(
    customerCode: '123',
    password: 'password',
    type: '1',
  );

  final loginResponse = LoginResponseParams(
    id: '1',
    updatedAt: '2023-01-01',
    createdAt: '2022-01-01',
    isActive: 'true',
    role: 'admin',
    gender: 'male',
    email: 'test@example.com',
    phone: '1234567890',
    dob: '2000-01-01',
    employeeCode: 'EMP123',
    lastName: 'Doe',
    middleName: 'M',
    firstName: 'John',
    password: 'password',
  );

  blocTest<SignInBloc, SignInState>(
    'emits [SignInLoading, SignInSuccess] when login is successful',
    build: () {
      when(mockUserLogin.call(params: loginRequest))
          .thenAnswer((_) async => Right(loginResponse));
      return signInBloc;
    },
    act: (bloc) => bloc.add(SignInLogin(
      id: loginRequest.customerCode,
      password: loginRequest.password,
      type: loginRequest.type,
    )),
    expect: () => [
      SignInLoading(),
      SignInSuccess(loginResponse),
    ],
  );

  blocTest<SignInBloc, SignInState>(
    'emits [SignInLoading, SignInFailure] when login fails',
    build: () {
      when(mockUserLogin.call(params: loginRequest))
          .thenAnswer((_) async => Left(Failure("Invalid credentials")));
      return signInBloc;
    },
    act: (bloc) => bloc.add(SignInLogin(
      id: loginRequest.customerCode,
      password: loginRequest.password,
      type: loginRequest.type,
    )),
    expect: () => [
      SignInLoading(),
      isA<SignInFailure>(),
    ],
  );
}
