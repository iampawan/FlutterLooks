import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterlooks/coolors.dart';

class ChristmasTree extends StatefulWidget {
  @override
  _ChristmasTreeState createState() => _ChristmasTreeState();
}

class _ChristmasTreeState extends State<ChristmasTree> {
  var _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        child: GestureDetector(
          onPanUpdate: (details) {
            _offset += details.delta;
            setState(() {});
          },
          onDoubleTap: () {
            _offset = Offset.zero;
            setState(() {});
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 500,
                child: Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Coolors.yellow1, Coolors.yellow2])),
                ),
              ),
              Positioned(
                top: 250,
                child: CustomPaint(
                  foregroundPainter: BannerPainter(
                      message: "Merry Christmas",
                      color: Colors.red,
                      layoutDirection: TextDirection.ltr,
                      location: BannerLocation.bottomEnd,
                      textDirection: TextDirection.ltr,
                      textStyle: TextStyle(fontSize: 8.0)),
                  painter: MyTriangle(),
                  size: Size.square(300),
                ),
              ),
              Positioned(
                top: 200,
                child: CustomPaint(
                  painter: MyTriangle(),
                  size: Size.square(250),
                ),
              ),
              Positioned(
                top: 180,
                child: CustomPaint(
                  painter: MyTriangle(),
                  size: Size.square(150),
                ),
              ),
              Positioned(
                top: 160,
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 70.0,
                ),
              ),
              Positioned(
                top: 520,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 500,
                left: 100,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 500,
                right: 100,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 420,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 430,
                left: 120,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 430,
                right: 120,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 300,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                top: 350,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    var paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Coolors.green1, Coolors.green2])
          .createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
