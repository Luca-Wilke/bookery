import 'package:bookery/services/secure_storage_service/secure_storage_sections/secure_storage_auth.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:bookery/services/services_library.dart';

enum SignUpWithGoogleResult {
  aborted,
  alreadySignedUp,
  success
}

enum SignInWithGoogleSilentlyResult {
  success,
  notSignedUp,
  alreadySignedIn
}

class AuthProviderGoogle {

  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<SignUpWithGoogleResult> signUpWithGoogle() async {

    //does the user already have a google account linked to bookery?
    if (_googleSignIn.currentUser != null) {
      logger.w("Sign up with Google. Failure. User has been signed up already.");
      return SignUpWithGoogleResult.alreadySignedUp;
    }

    try {
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

      //error checking
      if (googleSignInAccount == null) {
        logger.i("Sign up with Google. Failure. User has cancelled the dialog.");
        return SignUpWithGoogleResult.aborted;
      }

      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );

      final AuthResult result = await AuthService.auth.signInWithCredential(credential);

      logger.i("Firebase user {$result} has been signed up with Google.");

      //store credential
      print("Started to store google credentials...");

      await SecureStorageAuthSection.setCredential(
        provider: Provider.google,
        googleIdToken: googleSignInAuthentication.idToken,
        googleAccessToken: googleSignInAuthentication.accessToken
      );

      print("Google credentials has been stored successfully!");

      return SignUpWithGoogleResult.success;

    } catch (e) {
      throw new AuthenticationError(message: e.toString());
    }
  }

  static Future<bool> signOutWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await AuthService.auth.signOut();

      final FirebaseUser usr = await AuthService.auth.currentUser();
      logger.i("Firebase user {$usr} signed up with Google has been signed out."); 

      return true;
    } catch (e) {
      throw new AuthenticationError(message: e.toString());
    }
  }

  static Future<SignInWithGoogleSilentlyResult> signInWithGoogleSilently() async {

    //is the user already signed in via google?
    if (_googleSignIn.currentUser != null) {
      logger.w("Sign in silently with Google. Failure. The user is already signed in.");
      return SignInWithGoogleSilentlyResult.alreadySignedIn;
    }

    try {
      final GoogleSignInAccount account = await _googleSignIn.signInSilently();

      //error checking
      if (account == null) {
        logger.e("Sign in silently with Google. Failure. The user does not have a bookery account linked to Google.", null, StackTrace.current);
        return SignInWithGoogleSilentlyResult.notSignedUp;
      }

      logger.i("User has been signed in silently with Google.");
      return SignInWithGoogleSilentlyResult.success;
    } catch (e) {
      throw new AuthenticationError(message: e.toString());
    }
  }

}