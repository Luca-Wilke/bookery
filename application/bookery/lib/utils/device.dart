import 'dart:io';

import 'package:apple_sign_in/apple_sign_in.dart';

class Device {

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static Future<bool> appleSignInAvailable() async {
    return await AppleSignIn.isAvailable();
  }

}