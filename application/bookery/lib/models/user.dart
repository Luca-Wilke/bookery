import 'package:meta/meta.dart';

@immutable
class User {

  final String uid;
  final String name;

  User({
    this.uid,
    this.name,
  });

  factory User.initial() => User(
    uid: null,
    name: null
  );

}