import 'package:uptodo/utils/config.dart';
import 'package:uptodo/utils/constants.dart';

class Helper {
  static Future<String?> get userStored async {
    // final storage = getIt.get<SecureStorage>();
    final user = await readPrefData(kUserStored);
    if (user != null) return user;
    return null;
  }

 
}
