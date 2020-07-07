import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bookery/ui/screens/home/home_view.dart';
import 'package:bookery/ui/screens/launch/launch_view.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_view.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_view.dart';

class Router {

  static Map<String, AppRoute> routes = {
    RouteNames.launch: AppRoute(
      name: "/",
      builder: LaunchView()
    ),
    RouteNames.signUp: AppRoute(
      name: "/signUp",
      builder: SignUpView()
    ),
    RouteNames.signIn: AppRoute(
      name: "/signIn",
      builder: SignInView()
    ),
    RouteNames.home: AppRoute(
      name: "/home",
      builder: HomeView()
    )
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //either predefined builder widget in routes map or default route on error
    var _builder = routes[settings.name].builder ?? (_) => Scaffold(
      body: Center(
        child: Text("Error. No route defined for {$settings.name}")
      )
    );
    
    return MaterialPageRoute(
      builder: (context) => _builder
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

class RouteNames {
  static const launch = "launch";
  static const signUp = "signUp";
  static const signIn = "signIn";
  static const home = "home";
}