import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/auth/data/repository/login_repository_impl.dart';
import 'package:employee_ni_service/features/auth/data/source/login_api_service.dart';
import 'package:employee_ni_service/features/auth/domain/repository/login_repository.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'features/auth/domain/usecases/user_login.dart';

part 'service_locator.dart';
