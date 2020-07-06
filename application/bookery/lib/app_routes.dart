import 'package:bookery/ui/screens/home/home_view.dart';
import 'package:bookery/ui/screens/launch/launch_view.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_view.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, AppRoute> routes = {
    "launch": AppRoute(
      name: "/",
      builder: LaunchView()
    ),
    "signUp": AppRoute(
      name: "/signUp",
      builder: SignUpView()
    ),
    "signIn": AppRoute(
      name: "/signIn",
      builder: SignInView()
    ),
    "home": AppRoute(
      name: "/home",
      builder: HomeView()
    )
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => routes[settings.name].builder
    );
  }
}

class AppRoute {
  
  final String name;
  final Widget builder; 

  AppRoute({
    @required this.name,
    @required this.builder
  });

}