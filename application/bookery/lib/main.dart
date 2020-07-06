import 'package:flutter/material.dart';

import 'package:redux/redux.dart';

import 'package:bookery/app.dart';
import 'package:bookery/app_state.dart';
import 'package:bookery/reducers/app_reducer.dart';
import 'package:bookery/middleware/navigation_middleware.dart';

void main() {

  //create singleton global static store for redux architecture and pass it to the material app constructor
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      NavigationMiddleware()
    ],
  );

  runApp(App(store: store));

}