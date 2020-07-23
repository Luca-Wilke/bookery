import 'package:bookery/library.dart';
import 'package:bookery/ui/ui_library.dart';

class SignUpMiddleWidget extends StatelessWidget {

  final double startY;

  SignUpMiddleWidget({
    @required this.startY
  });

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    //final double height = MediaQuery.of(context).size.height;

    return Positioned(
      width: width * 0.75,
      top: startY,
      child: AutoSizeText.rich(
        new TextSpan(
          children: [
            TextSpan(
              text: I18n.of(context).newUser + "\n",
              style: Theme.of(context).textTheme.copyWith().headline6
            ),
            TextSpan(
              text: I18n.of(context).signUpNow + " ...",
              style: Theme.of(context).textTheme.copyWith().subtitle1 
            )
          ]
        ),
        maxLines: 5,
        textAlign: TextAlign.end,
      )
    );
  }
}