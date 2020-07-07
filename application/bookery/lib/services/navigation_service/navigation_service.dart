import 'package:bookery/app_routes.dart';
import 'package:bookery/services/navigation_service/navigation_routes/main_route.dart';
import 'package:bookery/ui/screens/error/error_view.dart';
import 'package:bookery/ui/screens/home/home_view.dart';
import 'package:bookery/ui/screens/launch/launch_view.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_view.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static MaterialPageRoute getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.launch:
        return MainRoute(LaunchView(), settings: settings);
        break;
      case AppRoutes.signUp:
        return MainRoute(SignUpView(), settings: settings);
        break;
      case AppRoutes.signIn:
        return MainRoute(SignInView(), settings: settings);
        break;
      case AppRoutes.home:
        return MainRoute(HomeView(), settings: settings);
        break;
      default: 
        return MainRoute(ErrorView(), settings: settings);
    }
  }
}