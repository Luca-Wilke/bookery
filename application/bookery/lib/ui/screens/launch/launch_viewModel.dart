import 'package:redux/redux.dart';

import 'package:bookery/app_state.dart';

class LaunchViewModel {

  final String name;

  LaunchViewModel({
    this.name
  });

  //return ViewModel from current app state containing all data needed for the view to display it
  static LaunchViewModel fromStore(Store<AppState> store) => LaunchViewModel(
    name: store.state.userState.name ?? "Unknown"
  );

}