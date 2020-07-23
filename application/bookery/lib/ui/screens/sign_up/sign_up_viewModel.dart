import 'package:bookery/library.dart';
import 'package:bookery/services/secure_storage_service/secure_storage_sections/secure_storage_auth.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';

class SignUpViewModel {

  static String userNameInput;

  SignUpViewModel();

  //calls AuthService method to sign up with google account. Returns true when success; otherwise false
  Future<dynamic> signUpWithGoogle() async {
    try {
      final SignUpWithGoogleResult result = await AuthProviderGoogle.signUpWithGoogle();
      _storeProviderId(Provider.google);
      return result;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> signUpWithEmailAndPassword({
    @required String email,
    @required String password
  }) async {
    try {
      final SignUpWithEmailAndPasswordResult result = await AuthProviderEmail.signUpWithEmailAndPassword(
        email: email,
        password: password
      );
      _storeProviderId(Provider.emailAndPassword);
      print("Started to store email and password credential.");
      await SecureStorageAuthSection.setCredential(
        provider: Provider.emailAndPassword,
        email: email,
        password: password
      );
      print("Email and password credential has been stored successfully.");
      return result;
    } catch (e) {
      return e;
    }
  }

  Future<bool> _storeProviderId(Provider provider) async {
    try {
      await SecureStorageAuthSection.setProviderId(provider);
      return true;
    } catch (e) {
      logger.e("Store provider id failed. {$e}");
      return false;
    }
  }

  void navigateToHomeView() {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(AppRoutes.home);
  }

  void navigateToEmailConfirmationView() {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(AppRoutes.verifyEmail);
  }

  static String getErrorMessageForNameInput(String name, BuildContext context) {
    if (name == "") {
      return I18n.of(context).noName;
    } else if (name.length < 4) {
      return I18n.of(context).nameTooShort;
    } else if (name.contains(" ")) {
      return I18n.of(context).nameNoSpaces;
    } else if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(name)) {
      return I18n.of(context).nameNoSpecialCharacters;
    }

    //valid input
    return "";
  }

  static void showErrorSnackbar(String error, BuildContext context) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))
      ),
        duration: Duration(seconds: 2),
        content: Text(error)
    ));
  }

}