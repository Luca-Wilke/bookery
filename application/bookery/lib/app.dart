import 'package:bookery/services/navigation_service/navigation_service.dart';
import 'package:bookery/services/navigation_service/route_aware_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:bookery/app_state.dart';
import 'package:bookery/router.dart';
import 'package:bookery/ui/screens/home/home_view.dart';
import 'package:bookery/ui/screens/launch/launch_view.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_view.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_view.dart';

class App extends StatelessWidget {

  final Store<AppState> store;

  App({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StoreProvider<AppState>(
      store: this.store,
      child: MaterialApp(
        routes: {
          RouteNames.launch: (context) => LaunchView(),
          RouteNames.signUp: (context) => SignUpView(),
          RouteNames.signIn: (context) => SignInView(),
          RouteNames.home: (context) => HomeView()
        },
        navigatorKey: NavigationService.navigatorKey,
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) => NavigationService.getRoute(settings) 
      )
    );
  }

}