part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class GetAssignedProductList extends ProductEvent {
  final String employeeId;
  GetAssignedProductList({
    required this.employeeId,
  });
}
