import 'package:dartz/dartz.dart';

import '../../data/model/request_fsr_model.dart';

abstract class RegisteredFsrRepository {
  Future<Either> fetchRegisteredFSR(RequestFsrModel params);
}
