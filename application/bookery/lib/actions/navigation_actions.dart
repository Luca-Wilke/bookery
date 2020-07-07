import 'package:meta/meta.dart';

@immutable
class NavigationPushAction {
  final String route;

  NavigationPushAction({@required this.route});
}

@immutable
class NavigationPopAction {

}

@immutable
class NavigationReplaceAction {
  final String route; 

  NavigationReplaceAction({@required this.route});
}