import 'package:flutter/cupertino.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width * 0.8531583, size.height * 0.6825143,
        size.width * 0.4986083, size.height * 0.6457143);
    path0.quadraticBezierTo(
        size.width * 0.1302417, size.height * 0.6974857, 0, size.height);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
