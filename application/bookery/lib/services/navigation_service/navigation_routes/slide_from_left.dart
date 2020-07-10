import 'package:flutter/material.dart';

class SlideFromLeftRoute extends PageRouteBuilder {

  Widget page;

  SlideFromLeftRoute({
    @required this.page
  }) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween(
              begin: Offset(-1.0, 0.0), 
              end: Offset(0.0, 0.0)
            )
          ),
          child: child
        ),
      );
    }
  );

}