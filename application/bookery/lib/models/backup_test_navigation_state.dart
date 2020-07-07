import 'package:meta/meta.dart';

import 'package:bookery/router.dart';

//helper variables
String _initialRoute = Router.routes["launch"].name;

@immutable
class NavigationState {

  //route name stack. current route: last entry
  final List<String> routes;

  NavigationState({
    this.routes
  });
  
  NavigationState copyWith({
    List<String> routes
  }) {
    return NavigationState(
      routes: routes ?? this.routes
    );
  }

  factory NavigationState.initial() => NavigationState(
    routes: List<String>()..add(_initialRoute)
  );

}