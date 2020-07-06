import 'package:meta/meta.dart';
import 'package:bookery/models/user.dart';

@immutable
class AppState {

  final User user;

  AppState({
    this.user
  });

  factory AppState.initial() => AppState(
    user: User.initial()
  );

  AppState copyWith({
    User user
  }) => AppState(
    user: user ?? this.user
  );

}