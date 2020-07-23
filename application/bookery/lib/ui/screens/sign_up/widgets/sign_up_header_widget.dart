import 'package:bookery/library.dart';
import 'package:bookery/ui/ui_library.dart';

class SignUpHeaderWidget extends StatelessWidget {

  final double startY;

  SignUpHeaderWidget({
    @required this.startY
  });

  @override
  Widget build(BuildContext context) {

    //final double width = MediaQuery.of(context).size.width;
    //final double height = MediaQuery.of(context).size.height;

    return Positioned(
      top: startY,
      child: AutoSizeText.rich(
        new TextSpan(
          children: [
            TextSpan(
              text: I18n.of(context).newUser + "\n\n",
              style: Theme.of(context).textTheme.copyWith().headline2
            ),
            TextSpan(
              text: "          " + I18n.of(context).signUpNow + " ...",
              style: Theme.of(context).textTheme.copyWith().subtitle1 
            )
          ]
        ),
        textAlign: TextAlign.start,
      )
    );
  }
}