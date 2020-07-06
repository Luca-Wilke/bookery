import 'package:flutter/material.dart';

import 'package:redux/redux.dart';

import 'package:bookery/app.dart';
import 'package:bookery/app_state.dart';
import 'package:bookery/reducers/app_reducer.dart';

void main() {

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial()
  );

  runApp(App(store: store));

}