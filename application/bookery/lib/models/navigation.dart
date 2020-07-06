import 'package:meta/meta.dart';

import 'package:bookery/routes.dart';

//helper variables
String _initialRoute = AppRoutes.launch;

@immutable
class Navigation {

  //route name stack. current route: last entry
  final List<String> routes;

  Navigation({
    this.routes
  });

  factory Navigation.initial() => Navigation(
    routes: List<String>()..add(_initialRoute)
  );

}