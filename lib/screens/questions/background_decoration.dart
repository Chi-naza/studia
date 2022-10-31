import 'package:flutter/material.dart';
import 'package:studia/configuration/themes/app_colors.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;

  const BackgroundDecoration({Key? key,  required this.child, this.showGradient = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: showGradient? null : Theme.of(context).primaryColor,
              gradient: showGradient? mainGradient() : null,
            ),
            // using the custom paint widget to paint our background screen
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
        ),
        // the body of this background decoration
        Positioned.fill(
          child: SafeArea(
            child: child,
          ),
        ),
      ],
    );
  }
}


// The class that does the painting. it paints with the color that is provided to it
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);

    // first path drawn
    final path = Path();
    // first painting : starting from the topLeft
    path.moveTo(0, 0);
    path.lineTo(size.width*0.2, 0);
    path.lineTo(0, size.height*0.4);
    path.close();

    // second path drawn
    final path2 = Path();
    // first painting : starting from the topRight
    path2.moveTo(size.width, 0);
    path2.lineTo(size.width*0.8, 0);
    path2.lineTo(size.width*0.2, size.height);
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}