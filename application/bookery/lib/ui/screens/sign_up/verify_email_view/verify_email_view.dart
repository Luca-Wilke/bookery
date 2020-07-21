import 'package:bookery/library.dart';
import 'package:bookery/services/auth_service/providers/email.dart';

class VerifyEmailView extends StatefulWidget {
  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {

  bool _verified = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();

    //anonymous async method
    Future(() async {
      _timer = Timer.periodic(
        //duration
        Duration(seconds: 5),
        //timer tick function
        (Timer timer) async {
          bool userIsVerified = await AuthProviderEmail.emailIsVerified();
          print("Check whether user has verified his email address. Result: {$userIsVerified}");
          if (userIsVerified) {
            setState(() {
              _verified = true;
            });
            timer.cancel();
          }
        } //end of timer tick function
      );
    });
  }

  @override 
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _verified ? "Your email is verified!" : "Please verify your email address."
    );
  }
}