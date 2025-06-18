import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteTransition {

  static CustomTransitionPage<void> fadeTransition({
    required GoRouterState state,
    required BuildContext context,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 300),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage<void> scaleTransition({
    required GoRouterState state,
    required BuildContext context,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 300),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
  static CustomTransitionPage<void> slideTransition({
    required GoRouterState state,
    required BuildContext context,
    required Widget child,
    bool? sideLeft,
    bool? bottomUp,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 400),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: bottomUp != null
                  ? bottomUp ? const Offset(0, 1) : const Offset(0, -1)
                  : sideLeft ?? false
                  ? const Offset(-1, 0)
                  : const Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeIn)),
          ),
          child: child,
        );
      },
    );
  }
  static CustomTransitionPage<void> rotationTransition({
    required GoRouterState state,
    required BuildContext context,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 300),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
    );
  }
}
