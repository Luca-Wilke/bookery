import 'package:bookery/services/services_library.dart';
import 'package:bookery/ui/screens/sign_in/sign_in_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SignInView extends StatelessWidget {

  static SignInViewModel _model = SignInViewModel();

  @override
  Widget build(BuildContext context) {

    //call _signIn function when widget building has been completed
    SchedulerBinding.instance.addPostFrameCallback((_) => _signIn());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Signing in...")
        )
      )
    );
  }

  void _signIn() async {

    dynamic result = await _model.signIn(
      email: "wilkeluca03@gmx.de",
      password: "Halloduda123!?"
    );
    
    switch (result) {
      case SignInWithGoogleSilentlyResult.success:
        _model.navigateToHomeView();
        break;
      case SignInWithGoogleSilentlyResult.notSignedUp:
        break;
      case SignInWithGoogleSilentlyResult.alreadySignedIn:
        _model.navigateToHomeView();
        break;
      default:
        //email and password
        switch (result) {
          case SignInWithEmailAndPasswordResult.success:
            _model.navigateToHomeView();
            break;
          default:
            _model.navigateToSignUpView();
            break;
        }
        break;
    }
  }

}