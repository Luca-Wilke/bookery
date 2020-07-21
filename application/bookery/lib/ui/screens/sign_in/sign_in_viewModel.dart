import 'package:bookery/library.dart';
import 'package:bookery/services/secure_storage_service/secure_storage_sections/secure_storage_auth.dart';
import 'package:bookery/services/services_library.dart';

class SignInViewModel {
  
  SignInViewModel();

  Future<dynamic> signIn({
    String email,
    String password
  }) async {
    //read provider from secure storage
    try {
      dynamic signInWith = await SecureStorageAuthSection.getProvider();
      
      switch (signInWith) {
        case Provider.google:
          return await AuthProviderGoogle.signInWithGoogleSilently();
          break;
        case Provider.emailAndPassword:
          return await AuthProviderEmail.signInWithEmailAndPassword(
            email: email,
            password: password
          );
          break;
      }

    } catch (e) {
      //failure. return error object
      return e;
    }
  }

  void navigateToHomeView() {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(
      AppRoutes.home
    );
  }

  void navigateToSignUpView() {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(
      AppRoutes.signUp
    );
  }

}