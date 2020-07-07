import 'package:bookery/config/app_config.dart';
import 'package:bookery/services/navigation_service/navigation_service.dart';
import 'package:bookery/services/navigation_service/route_aware_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:bookery/app_state.dart';

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
        //meta preferences
        title: AppConfig.name,
        //routes
        navigatorKey: NavigationService.navigatorKey,
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) => NavigationService.getRoute(settings) 
      )
    );
  }

}