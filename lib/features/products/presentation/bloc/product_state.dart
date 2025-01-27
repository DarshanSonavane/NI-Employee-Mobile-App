part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoader extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ResponseAssignedEmployeeProductList>
      responseAssignedEmployeeProductList;
  ProductSuccess(this.responseAssignedEmployeeProductList);
}

final class ProductFailure extends ProductState {
  final String message;
  ProductFailure(this.message);
}
