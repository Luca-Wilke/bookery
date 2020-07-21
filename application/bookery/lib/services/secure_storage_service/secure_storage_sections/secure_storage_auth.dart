import 'package:bookery/services/secure_storage_service/secure_storage_service.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:meta/meta.dart';

enum AuthSectionSetValueResult {
  success,
}

class SecureStorageAuthGetCredentialResult {
  final String email;
  final String password;
  final String googleAccessToken;
  final String googleIdToken;

  SecureStorageAuthGetCredentialResult({
    this.email,
    this.password,
    this.googleIdToken,
    this.googleAccessToken
  });
}

String _buildKey(String keyId) {
  String key = "AUTH:$keyId";
  print("Key build: {$key}");
  return key;
}

class SecureStorageAuthSection {

  //form: AUTH:key=value

  static Future<bool> setProviderId(Provider provider) async {
    dynamic result = await SecureStorageService.write(
      _buildKey("providerId"), 
      AuthService.providerProviderIdMap[provider]
    );

    //failure
    if (result is MemoryErrorType) {
      throw new MemoryError(
        message: "Failed to override provider ID.",
        type: result
      );
    }

    //success
    return true;
  }

  static Future<Provider> getProvider() async {
    dynamic result = await SecureStorageService.read(_buildKey("providerId"));

    //failure
    if (result is MemoryErrorType) {
      throw new MemoryError(
        message: "Failed to get provider ID.",
        type: result
      );
    }

    //success: return provider enum based on returned provider id string
    Provider prov = AuthService.providerProviderIdMap.entries.firstWhere((element) {
      return element.value == result as String;
    }).key;

    return prov;
  }

  static Future<bool> setCredential({
    @required Provider provider,
    String email,
    String password,
    String googleIdToken,
    String googleAccessToken
  }) async {
    Map<String, String> values;

    switch (provider) {
      case Provider.emailAndPassword:
        //override email and password value
        values = {
          _buildKey("email"): email ?? null,
          _buildKey("password"): password ?? null,
        };
        break;
      case Provider.google: 
        //override googleIdToken and googleAccessToken value
        values = {
          _buildKey("googleIdToken"): googleIdToken ?? null,
          _buildKey("googleAccessToken"): googleAccessToken ?? null
        };
        break;
    }

    //loop through values map and store each map entry in safe storage
    values.forEach((key, value) async {
      dynamic result = await SecureStorageService.write(
        key,
        value
      );
      //error checking
      if (result is MemoryErrorType) {
        throw new MemoryError(
          message: "Failed to override credentials. key: {$key}, value: {$value}",
          type: result
        );
      }
    });

    //success
    return true;
  }

  static Future<SecureStorageAuthGetCredentialResult> getCredential({@required Provider provider}) async {
    switch (provider) {
      case Provider.google:
        //get google id token
        dynamic googleIdToken = await SecureStorageService.read(_buildKey("googleIdToken"));
        if (googleIdToken is MemoryErrorType) {
          throw new MemoryError(
            message: "Failed to get googleIdToken.",
            type: googleIdToken
          );
        }
        //get google access token
        dynamic googleAccessToken = await SecureStorageService.read(_buildKey("googleAccessToken"));
        if (googleAccessToken is MemoryErrorType) {
          throw new MemoryError(
            message: "Failed to get googleAccessToken.",
            type: googleAccessToken
          );
        }
        //return credential object
        return new SecureStorageAuthGetCredentialResult(
          googleIdToken: googleIdToken as String,
          googleAccessToken: googleAccessToken as String
        );
        break;
      case Provider.emailAndPassword:
        //get email
        dynamic email = await SecureStorageService.read(_buildKey("email"));
        if (email is MemoryErrorType) {
          throw new MemoryError(
            message: "Failed to get email.",
            type: email
          );
        }
        //get password
        dynamic password = await SecureStorageService.read(_buildKey("password"));
        if (password is MemoryErrorType) {
          throw new MemoryError(
            message: "Failed to get password.",
            type: password
          );
        }
        //return credential object
        return new SecureStorageAuthGetCredentialResult(
          email: email,
          password: password
        );
        break;
      default:
        throw new Exception("Provider is not supported."); 
        break;
    }
  }

}