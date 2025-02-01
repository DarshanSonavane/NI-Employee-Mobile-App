import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/product_assignment_model.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/domain/repository/product_assigment_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/assign_product_to_emp_service.dart';

class ProductAssignRepoImpl extends ProductAssigmentRepository {
  @override
  Future<Either> assignProducts(ProductAssignmentModel productAssignmentModel) {
    return sl<AssignProductToEmpService>().assignedProd(productAssignmentModel);
  }
}
