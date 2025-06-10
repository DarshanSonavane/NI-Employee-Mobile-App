import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/product_assignment_model.dart';

abstract class ProductAssigmentRepository {
  Future<Either> assignProducts(
    ProductAssignmentModel productAssignmentModel,
  );
}
