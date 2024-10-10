import 'package:hive/hive.dart';

import '../../features/auth/data/models/login_response_params.dart';

class HiveStorageService {
  Future<void> saveUser(LoginResponseParams user) async {
    var box = Hive.box<LoginResponseParams>('loginBox');
    await box.put('loggedInUser', user);
  }

  LoginResponseParams? getUser() {
    var box = Hive.box<LoginResponseParams>('loginBox');
    return box.get('loggedInUser');
  }
}
