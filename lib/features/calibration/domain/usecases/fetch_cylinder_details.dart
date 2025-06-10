import 'package:dartz/dartz.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/fetch_cylinder_details_repository.dart';

class FetchCylinderDetails implements UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchCylinderDetailsRepository>().getCylinderDetails();
  }
}
