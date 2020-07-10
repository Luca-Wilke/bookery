import 'package:redux/redux.dart';

import 'package:bookery/app_state.dart';

class HomeViewModel {

  final String name;

  HomeViewModel({
    this.name
  });

  //return ViewModel from current app state containing all data needed for the view to display it
  static HomeViewModel fromStore(Store<AppState> store) => HomeViewModel(
    name: store.state.userState.name ?? "Unknown"
  );

}