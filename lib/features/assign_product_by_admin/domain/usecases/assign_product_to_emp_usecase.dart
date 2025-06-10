import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/product_assignment_model.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/product_assigment_repository.dart';

class AssignProductToEmpUsecase
    implements UseCase<Either, ProductAssignmentModel> {
  @override
  Future<Either> call({ProductAssignmentModel? params}) async {
    return await sl<ProductAssigmentRepository>().assignProducts(params!);
  }
}
