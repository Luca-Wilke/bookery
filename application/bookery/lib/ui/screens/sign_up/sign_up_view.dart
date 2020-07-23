import 'package:bookery/ui/screens/sign_up/sign_up_painter.dart';
import 'package:bookery/ui/screens/sign_up/widgets/sign_up_body_widget.dart';
import 'package:bookery/ui/screens/sign_up/widgets/sign_up_header_widget.dart';
import 'package:bookery/ui/screens/sign_up/widgets/sign_up_middle_widget.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {

  //static SignUpViewModel _model = SignUpViewModel();

  @override 
  Widget build(BuildContext context) {

    Device.setLandscapeOrientation();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(
            heightFactor: 0.45
          ),
          child: Container(
            //container should fill the entire screen space
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SignUpHeaderWidget(),
                SignUpMiddleWidget(
                  startY: (0.45-0.185) * MediaQuery.of(context).size.height
                ),
                SignUpBodyWidget()
              ],
            ),
          )
        )
      )
    );
  }

}