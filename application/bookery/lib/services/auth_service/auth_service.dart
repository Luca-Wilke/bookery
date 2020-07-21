import 'package:bookery/services/secure_storage_service/secure_storage_sections/secure_storage_auth.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:bookery/services/services_library.dart';

//import 'package:bookery/services/auth_service/providers/apple.dart';
//import 'package:bookery/services/auth_service/providers/email.dart';
//import 'package:bookery/services/auth_service/providers/google.dart';
//import 'package:bookery/services/auth_service/providers/twitter.dart';

enum Provider {
  google,
  emailAndPassword
}

class AuthService {

  static FirebaseAuth auth = FirebaseAuth.instance;

  static Map<Provider, String> providerProviderIdMap = {
    Provider.emailAndPassword: "password",
    Provider.google: "google.com"
  };

  static Future<bool> userExists() async {
    try {
      FirebaseUser user = await auth.currentUser();

      logger.i("Check whether user has been signed up. Result: {$user}");

      return user is FirebaseUser ? true : false;
    } catch (e) {
      throw new AuthenticationError(
        message: e.toString()
      );
    }
  }

  static Future<bool> userDelete({
    String password
  }) async {
    try {
      FirebaseUser user = await auth.currentUser();

      //error checking
      if (user == null) {
        logger.e("Deleting firebase user failed. The is no current user to delete.", null, StackTrace.current);
        return false;
      }

      String provId;
      final List<UserInfo> providerData = user.providerData;

      if (user.providerData.length <= 1) {
        logger.e("Deleting firebase user failed. Provider data is less or equal to 1. There are no providers linked to this account other than firebase.", null, StackTrace.current);
        return false;
      }

      provId = providerData[1].providerId;

      logger.i("Deleting firebase user. Auth provider: {$provId}");

      AuthCredential credential;

      switch(provId) {
        case "google.com":
          //read id token and access token from secure store 
          SecureStorageAuthGetCredentialResult result = await SecureStorageAuthSection.getCredential(provider: Provider.google);
          credential = GoogleAuthProvider.getCredential(
            idToken: result.googleIdToken,
            accessToken: result.googleAccessToken
          );
          break;
        case "password":
          //read id token and access token from secure store 
          SecureStorageAuthGetCredentialResult result = await SecureStorageAuthSection.getCredential(provider: Provider.emailAndPassword);
          credential = EmailAuthProvider.getCredential(
            email: result.email,
            password: result.password
          );
          break;
      }

      await user.reauthenticateWithCredential(
        credential
      );

      await user.unlinkFromProvider(provId);
      await user.delete();

      logger.i("Successfully deleted firebase user with provider id {$provId}");

      return true;
    } catch (e) {
      throw new AuthenticationError(
        message: e.toString()
      );
    }
  }

}