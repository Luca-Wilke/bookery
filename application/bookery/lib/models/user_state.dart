import 'package:meta/meta.dart';

@immutable
class UserState {

  final String uid;
  final String name;

  UserState({
    @required this.uid,
    @required this.name,
  });

  UserState copyWith({
    String uid,
    String name
  }) {
    return UserState(
      uid: uid ?? this.uid,
      name: name ?? this.name
    );
  }

  factory UserState.initial() => UserState(
    uid: null,
    name: null
  );

}