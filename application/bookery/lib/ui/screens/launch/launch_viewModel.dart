import 'package:bookery/library.dart';
import 'package:bookery/services/secure_storage_service/secure_storage_sections/secure_storage_auth.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';

class LaunchViewModel {

  LaunchViewModel();

  void navigateToNextView() async {

    String nextView;

    try {
      if (await AuthService.isUserSignedUp()) {
        if (await SecureStorageAuthSection.getProvider() == Provider.emailAndPassword) {
          if (await AuthProviderEmail.emailIsVerified()) {
            //firebase user exists, user has been signed in via email and password and email is verified: to sign in screen
            nextView = AppRoutes.signIn;
          } else {
            //firebase user exists, user has been signed in via email and password, but email is not verified: to verify email screen
            nextView = AppRoutes.verifyEmail;
          }
        } else {
          //firebase user exists, user has been signed in via any provider but email and password: to sign in screen
          nextView = AppRoutes.signIn;
        }
      } else {
        //firebase user does not exist: to sign up screen
        throw new AuthenticationError(
          message: "There is no firebase user."
        );
      }

      if (await AuthService.getProviderCount() <= 1) {
        //there are no providers linked to the account other than firebase. to sign up screen
        throw new AuthenticationError(
          message: "There are no providers linked to the firebase account other than firebase."
        );
      }

    } catch (e) {
      //an error occurred. to sign up screen
      nextView = AppRoutes.signUp;
    }

    NavigationService.navigatorKey.currentState.pushReplacementNamed(AppRoutes.signUp); //TODO change to nextView

  }

}