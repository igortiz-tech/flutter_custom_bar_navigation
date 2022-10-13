import 'package:flutter/cupertino.dart';

class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double heigth = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, heigth - 25);
    path.quadraticBezierTo(width/2, heigth, width, heigth - 25);
    path.lineTo(width, 0);

    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}