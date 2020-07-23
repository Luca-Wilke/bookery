import 'dart:io';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter/services.dart';

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

  static void setPortraitOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static void setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

}