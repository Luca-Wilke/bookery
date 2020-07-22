import 'package:bookery/models/user.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';

class UserService {

  static User _currentUser;
  static User get currentUser => _currentUser;

  static Future<void> updateUser(FirebaseUser user) async {
    try {
      if (user != null) {
        _currentUser = await FirestoreService.getUser(user.uid);
      } else {
        logger.w("Current user is null. Failed to update user.");
      }
    } catch (e) {
      logger.e("Failed to update user." + e.toString());
    }
  } 

}