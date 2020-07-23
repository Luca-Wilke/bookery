import 'package:bookery/library.dart';
import 'package:meta/meta.dart';

class BackgroundPainter extends CustomPainter {

  final Paint upperPaint;
  final Paint middlePaint;
  final Paint lowerPaint;
  final Paint backgroundPaint;

  final double heightFactor;

  BackgroundPainter({
    @required this.heightFactor
  }) :
    upperPaint = new Paint(),
    middlePaint = new Paint(),
    lowerPaint = new Paint(),
    backgroundPaint = new Paint() {
      upperPaint.color = Colors.blue[500];
      upperPaint.isAntiAlias = true;
      upperPaint.style = PaintingStyle.fill;

      middlePaint.color = Colors.blue[300];
      middlePaint.isAntiAlias = true;
      middlePaint.style = PaintingStyle.fill;

      lowerPaint.color = Colors.blue[100];
      lowerPaint.isAntiAlias = true;
      lowerPaint.style = PaintingStyle.fill;

      backgroundPaint.color = Colors.blue[50];
      backgroundPaint.style = PaintingStyle.fill;
    }

  @override 
  void paint(Canvas canvas, Size size) {
    canvas.save();

    drawBackgroundShapeTop(
      canvas: canvas, 
      size: size
    );

    canvas.restore();
  }

  void drawBackgroundShapeTop({
    @required Canvas canvas,
    @required Size size
  }) {

    //draw background
    Path backgroundPath = new Path();
    //the entire screen
    backgroundPath.addRect(Rect.fromLTRB(0, 0, size.width, size.height));

    final double curveStartX = -(size.width*0.1); 
    final double curveEndX = size.width*1.1;

    //draw lower path
    Path lowerPath = new Path();
    //curve effect;
    lowerPath.addArc(
      Rect.fromLTRB(
        curveStartX, //left
        0, //top 
        curveEndX*1.5, //right 
        size.height * (heightFactor+0.1)  //bottom
      ),
      0.0,
      10
    );

    //draw middle path
    Path middlePath = new Path();
    //curve effect;
    middlePath.addArc(
      Rect.fromLTRB(
        curveStartX, //left
        0, //top 
        curveEndX*1.3, //right 
        size.height * (heightFactor+0.05)  //bottom
      ),
      0.0,
      10
    );

    //draw top path (upperPath)
    Path upperPath = new Path();
    //curve effect;
    upperPath.addArc(
      Rect.fromLTRB(
        curveStartX, //left
        -(size.height*0.25), //top 
        curveEndX*1.4, //right 
        size.height * (heightFactor) //bottom
      ),
      0.0,
      10
    );

    //apply paths to painters
    canvas.drawPath(backgroundPath, backgroundPaint);
    canvas.drawPath(lowerPath, lowerPaint);
    canvas.drawPath(middlePath, middlePaint);
    canvas.drawPath(upperPath, upperPaint);
  }

  @override 
  bool shouldRepaint(CustomPainter oldPainter) {
    return false;
  }

}