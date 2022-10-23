import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            painter: BottomNavPainter(),
            size: Size(MediaQuery.of(context).size.width, 60),
          ),
          Positioned(top: 0,child: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add, color: Colors.white)))

        ],
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {

  double notchRadius;

  BottomNavPainter({this.notchRadius = 40});

  @override
  void paint(Canvas canvas, Size size) {
    Path a = Path();
    Paint x = Paint();
    a.moveTo(0, 0);
    a.lineTo(size.width * 0.5 - notchRadius, 0);
    a.quadraticBezierTo(size.width * 0.5 - notchRadius, notchRadius+5, size.width * 0.5, notchRadius+5);
    a.quadraticBezierTo(size.width * 0.5 + notchRadius, notchRadius+5, size.width * 0.5 + notchRadius, 0);
    //a.quadraticBezierTo(size.width * 0.5 - 25, 25, size.width * 0.5, 50);
    //a.quadraticBezierTo(size.width * 0.5 + 25, 25, size.width * 0.5 + 50, 0);
    a.lineTo(size.width, 0);
    a.lineTo(size.width, size.height);
    a.lineTo(0, size.height);
    a.close();
    canvas.drawPath(a, Paint()..color=Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

