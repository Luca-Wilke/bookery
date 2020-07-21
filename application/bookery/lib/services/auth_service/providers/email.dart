import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:meta/meta.dart';

enum SignUpWithEmailAndPasswordResult {
  success
}

enum SignInWithEmailAndPasswordResult {
  success
}

class AuthProviderEmail {

  static Future<bool> emailIsVerified() async {
    try {
      //update auth instance
      await AuthService.auth.currentUser()..reload();
      //get current user
      FirebaseUser user = await AuthService.auth.currentUser();
      //return is email verified ? true : false
      return user.isEmailVerified;
    } catch (e) {
      logger.e("An error occurred while trying to check if email is verified. Error object below. \n\n");
      print(e);
      return false;
    }
  }

  static Future<SignUpWithEmailAndPasswordResult> signUpWithEmailAndPassword({
    @required String email, 
    @required String password
  }) async {
    try {
      AuthResult result = await AuthService.auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      FirebaseUser user = result.user;

      await user.sendEmailVerification();

      logger.i("Bookery user {$user} has been signed up with email and password and confirmation email has been sent.");

      return SignUpWithEmailAndPasswordResult.success;
    } catch (e) {
      throw new AuthenticationError(
        message: e.toString()
      );
    }
  }

  static Future<SignInWithEmailAndPasswordResult> signInWithEmailAndPassword({
    @required String email,
    @required String password
  }) async {
    try {
      AuthResult result = await AuthService.auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      FirebaseUser user = result.user;

      logger.i(" user {Bookery user {$user} has been signed in with email password.");

      return SignInWithEmailAndPasswordResult.success;
    } catch (e) {
      throw new AuthenticationError(
        message: e.toString()
      );
    }
  }

  static Future signOutWithEmailAndPassword() async {
    try {
      await AuthService.auth.signOut();

      logger.i("User has been signed out via email and password.");
    } catch (e) {
      throw new AuthenticationError(
        message: e.toString()
      );
    }
  }

}