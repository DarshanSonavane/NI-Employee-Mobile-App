import 'package:hive/hive.dart';

import '../../features/auth/data/models/login_response_params.dart';
import '../constants/constants.dart';

class HiveStorageService {
  Future<void> saveUser(LoginResponseParams user) async {
    var box = Hive.box<LoginResponseParams>(Constants.loginHiveBox);
    await box.put('loggedInUser', user);
  }

  LoginResponseParams? getUser() {
    var box = Hive.box<LoginResponseParams>(Constants.loginHiveBox);
    return box.get('loggedInUser');
  }

  Future<void> clearUser() async {
    var box = Hive.box<LoginResponseParams>(Constants.loginHiveBox);
    await box.delete('loggedInUser');
  }
}
