import 'package:meta/meta.dart';

//push a new route to the routes stack
@immutable
class NavigationPushAction {
  final String route;

  NavigationPushAction({this.route});
}

//pop the last route of the routes stack
@immutable
class NavigationPopAction {
  final String route;

  NavigationPopAction({this.route});
}