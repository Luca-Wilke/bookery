import 'package:bookery/ui/screens/sign_up/verify_email_view/verify_email_view.dart';
import 'package:bookery/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:bookery/app_routes.dart';
import 'package:bookery/ui/screens/error/error_view.dart';
import 'package:bookery/ui/screens/home/home_view.dart';
import 'package:bookery/ui/screens/launch/launch_view.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_view.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_view.dart';
import 'package:bookery/services/navigation_service/navigation_routes/slide_from_right.dart';
import 'package:bookery/services/navigation_service/navigation_routes/slide_from_left.dart';

class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static PageRoute getRoute(RouteSettings settings) {

    logger.i("Navigating to {$settings.name}.");

    switch (settings.name) {
      case AppRoutes.launch:
        return SlideFromRightRoute(page: LaunchView());
        break;
      case AppRoutes.signUp:
        return SlideFromRightRoute(page: SignUpView());
        break;
      case AppRoutes.signIn:
        return SlideFromRightRoute(page: SignInView());
        break;
      case AppRoutes.home:
        return SlideFromLeftRoute(page: HomeView());
        break;
      case AppRoutes.verifyEmail:
        return SlideFromLeftRoute(page: VerifyEmailView());
        break;
      default: 
        return MaterialPageRoute(builder: (context) => ErrorView(), settings: RouteSettings(arguments: settings.name));
    }
  }
  
}