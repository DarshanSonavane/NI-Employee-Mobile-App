import '../../service_locator_dependecies.dart';
import '../database/hive_storage_service.dart';

final hiveStorageService = sl<HiveStorageService>();

String fetchUserRole() {
  var fetchuser = hiveStorageService.getUser();
  return fetchuser?.role ?? "";
}

String fetchUserId() {
  var fetchuser = hiveStorageService.getUser();
  return fetchuser?.id ?? "";
}
