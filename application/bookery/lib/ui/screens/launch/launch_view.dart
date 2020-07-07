import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:bookery/ui/screens/launch/launch_viewModel.dart';
import 'package:bookery/app_state.dart';
import 'package:bookery/app_routes.dart';

class LaunchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LaunchViewModel>(
      converter: (store) => LaunchViewModel.fromStore(store),
      builder: (context, model) {
        return RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.home);
          },
          child: Text("Launch")
        );
      }
    ); 
  }
}