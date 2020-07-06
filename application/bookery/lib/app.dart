import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:bookery/app_state.dart';
import 'package:bookery/app_routes.dart';
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
          AppRoutes.routes["launch"].name: (context) => LaunchView(),
          AppRoutes.routes["signUp"].name: (context) => SignUpView(),
          AppRoutes.routes["signIn"].name: (context) => SignInView(),
          AppRoutes.routes["home"].name: (context) => HomeView()
        },
        initialRoute: AppRoutes.routes["launch"].name,
        onGenerateRoute: AppRoutes.generateRoute
      )
    );
  }

}