import 'package:flutter/material.dart';

class RouteBuilder {
  static Route<MaterialPageRoute<Widget>> slideRight(
      {required Widget newRoute}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newRoute,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = const Offset(1, 0);
        Offset end = Offset.zero;
        Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
        Animation<Offset> offsetTransition = tween.animate(animation);
        return SlideTransition(
          position: offsetTransition,
          child: child,
        );
      },
    );
  }
}
