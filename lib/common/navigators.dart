import 'package:flutter/widgets.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<T?> push<T>(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).push(
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    }));

void pop<T extends Object?>([T? result]) =>
    Navigator.of(navigatorKey.currentContext!).pop();

Future<void> pushReplacement(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    ));

Future<T?> pushAndRemoveUntil<T>(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    ), (c) => false);
