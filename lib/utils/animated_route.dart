import 'package:flutter/cupertino.dart';

import '../components/cicle_clipper.dart';

class AnimatedRoute{
  Route createRoute(Widget screen ) {
    return PageRouteBuilder(
      transitionDuration:const  Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      opaque: false,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var screenSize = MediaQuery.of(context).size;
        Offset center = Offset(screenSize.width - 40, 100);
        double beginRadius = 0.0;
        double endRadius = screenSize.height * 1.2;

        var tween = Tween(begin: beginRadius, end: endRadius);
        var radiusTweenAnimation = animation.drive(tween);

        return ClipPath(
          clipper:
          CircleRevealClipper(radius: radiusTweenAnimation.value, center: center),
          child: child,
        );
      },
    );
  }
}