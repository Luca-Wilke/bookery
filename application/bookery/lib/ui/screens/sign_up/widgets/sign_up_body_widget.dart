import 'package:bookery/library.dart';
import 'package:bookery/services/services_library.dart';
import 'package:flutter/gestures.dart';

class SignUpBodyWidget extends StatefulWidget {
  @override
  _SignUpBodyWidgetState createState() => _SignUpBodyWidgetState();
}

class _SignUpBodyWidgetState extends State<SignUpBodyWidget> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: IntrinsicWidth(
        child: Column(
          children: <Widget>[
            //email and password
            new _SignUpMethodButton(
              signUpMethodTitle: I18n.of(context).signUpWithEmailAndPassword,
              signUpMethodIcon: Icon(Icons.email),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            //google
            new _SignUpMethodButton(
              signUpMethodTitle: I18n.of(context).signUpWithGoogle,
              signUpMethodIcon: Image.asset(
                "assets/google-icon.png", 
                width: 24.0, 
                height: 24.0 
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1),
            //i already have an account text button
            _buildAlreadyHaveAccountText(context)
          ],
        ),
      ),
    );
  }

  Widget _buildAlreadyHaveAccountText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: I18n.of(context).alreadyHaveAccount,
        style: Theme.of(context).textTheme.bodyText2.merge(
          TextStyle(
            color: Colors.blueGrey,
            decoration: TextDecoration.underline
          )
        ),
        recognizer: new TapGestureRecognizer()..onTapUp = (_) => 
          //navigate to sign in view in case user already has an account
          NavigationService.navigatorKey.currentState.pushReplacementNamed(
            AppRoutes.signIn
          )
      )
    );
  }

}


class _SignUpMethodButton extends StatefulWidget {

  final String signUpMethodTitle;
  final dynamic signUpMethodIcon;

  _SignUpMethodButton({
    Key key,
    @required this.signUpMethodTitle, 
    @required this.signUpMethodIcon
  }) : super(key: key);

  @override
  __SignUpMethodButtonState createState() => __SignUpMethodButtonState();
}

class __SignUpMethodButtonState extends State<_SignUpMethodButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
        side: BorderSide(color: Colors.green[300])
      ),
      child: Row(
        children: <Widget>[
          widget.signUpMethodIcon as Widget,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "   ... " + I18n.of(context).withWord + " ", 
                  style: Theme.of(context).textTheme.caption
                ), 
                TextSpan(
                  text: widget.signUpMethodTitle, 
                  style: Theme.of(context).textTheme.bodyText1
                )
              ]
            )
          ),
        ],
      ),
    );
  }
}