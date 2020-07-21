import 'package:bookery/library.dart';
import 'package:bookery/ui/screens/launch/launch_viewModel.dart';
import 'package:flutter/scheduler.dart';

class LaunchView extends StatelessWidget {

  static LaunchViewModel _model = LaunchViewModel();

  @override
  Widget build(BuildContext context) 
  {
    //call _onBuildFinished function when widget building has been completed
    SchedulerBinding.instance.addPostFrameCallback((_) => _onBuildFinished() );

    //actual ui building code
    return Scaffold(
      body: SafeArea(
        child: Container()
      )
    );
  }

  //either navigate to signin or signup screen (does user have an bookery account yet?)
  void _onBuildFinished() => _model.navigateToNextView();

}