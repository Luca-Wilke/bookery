import 'package:bookery/ui/screens/home/home_view.dart';
import 'package:bookery/ui/screens/launch/launch_view.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_view.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
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
    //either predefined builder widget in routes map or default route on error
    var _builder = routes[settings.name].builder ?? (_) => Scaffold(
      body: Center(
        child: Text("No route defined for {$settings.name}")
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