import 'package:bookery/library.dart';
import 'package:bookery/services/services_library.dart';

class LaunchViewModel {

  LaunchViewModel();

  void navigateToNextView() async {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(
      await AuthService.userExists() ? 
        AppRoutes.signIn : 
        AppRoutes.signUp
    );
  }

}