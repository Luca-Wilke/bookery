import 'package:bookery/library.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';

class HomeViewModel {

  HomeViewModel();

  void deleteAccount() async {
    try {
      bool result = await AuthService.userDelete(password: "Halloduda123!?");
      if (result == false) {
        logger.w("Deleting account failed. Result is false.");
        return;
      }
      //successfully deleted firebase user
      navigateToSignUpView();
    } catch (e) {
      logger.w("Deleting account failed. Error has been catched: \n\n {$e}");
    }
  } 

  void navigateToSignUpView() {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(
      AppRoutes.signUp
    );
  }

}