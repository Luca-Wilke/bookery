import 'package:meta/meta.dart';

@immutable
class UserChangeNameAction {
  final String name;

  UserChangeNameAction({this.name});
}