import 'package:bookery/services/services_library.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_viewModel.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {

  static SignUpViewModel _model = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Sign up with Google."),
                onPressed: () async {
                  dynamic result = await _model.signUpWithGoogle();
                  
                  switch (result) {
                    case SignUpWithGoogleResult.success:
                      _model.navigateToHomeView();
                      break;
                    case SignUpWithGoogleResult.alreadySignedUp:
                      break;
                    case SignUpWithGoogleResult.aborted:
                      break;
                    default:
                      showDialog(
                        context: context, 
                        child: AlertDialog(title: Text("Error"), content: Text("Signing up with Google failed."))
                      );
                      break;
                  }
                },
              ),
              RaisedButton(
                child: Text("Sign up with email and password."),
                onPressed: () async {
                  dynamic result = await _model.signUpWithEmailAndPassword(
                    email: "wilkeluca03@gmx.de",
                    password: "Halloduda123!?"
                  );

                  switch (result) {
                    case SignUpWithEmailAndPasswordResult.success:
                    _model.navigateToEmailConfirmationView();
                      break;
                    default: 
                      showDialog(
                        context: context, 
                        child: AlertDialog(title: Text("Error"), content: Text("Signing up with email and password failed."))
                      );
                      break;
                  }
                }
              )
            ]
          )
        )
      )
    );
  }
}