import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/auth/data/repository/login_repository_impl.dart';
import 'package:employee_ni_service/features/auth/data/source/login_api_service.dart';
import 'package:employee_ni_service/features/auth/domain/repository/login_repository.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:employee_ni_service/features/set_reset_password/data/source/set_reset_password_service.dart';
import 'package:employee_ni_service/features/set_reset_password/domain/repository/set_reset_password_repository.dart';
import 'package:employee_ni_service/features/set_reset_password/presentation/bloc/set_reset_password_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'core/database/hive_service.dart';
import 'core/database/hive_storage_service.dart';
import 'features/auth/domain/usecases/user_login.dart';
import 'features/set_reset_password/data/repository/set_reset_password_repository_impl.dart';
import 'features/set_reset_password/domain/usecase/set_reset_password_usecase.dart';

part 'service_locator.dart';
