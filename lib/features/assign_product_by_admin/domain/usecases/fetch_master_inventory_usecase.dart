import 'package:dartz/dartz.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/fetch_master_inventory_repository.dart';

class FetchMasterInventoryUsecase implements UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchMasterInventoryRepository>().getMasterInventory();
  }
}
