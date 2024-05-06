import 'package:animate_do/animate_do.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';

import 'package:flutter/material.dart';

class CustomFadeInDown extends StatelessWidget {
  const CustomFadeInDown({
    required this.child,
    this.duration=1,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      duration: Duration(seconds: duration),
      child: child,
    );
  }
}

class CustomFadeInUp extends StatelessWidget {
  const CustomFadeInUp({
    required this.child,
     this.duration=1,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      duration: Duration(seconds: duration),
      child: child,
    );
  }
}

class CustomFadeInLeft extends StatelessWidget {
  const CustomFadeInLeft({
    required this.child,
     this.duration=1,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return SharedPref().getString(PrefKeys.language) == 'ar'
        ? FadeInLeft(
            delay: const Duration(milliseconds: 300),
            duration: Duration(seconds: duration),
            child: child,
          )
        : FadeInRight(
            delay: const Duration(milliseconds: 300),
            duration: Duration(seconds: duration),
            child: child,
          );
  }
}

class CustomFadeInRight extends StatelessWidget {
  const CustomFadeInRight({
    required this.child,
     this.duration=1,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return SharedPref().getString(PrefKeys.language) == 'ar'
        ? FadeInRight(
            delay: const Duration(milliseconds: 300),
            duration: Duration(seconds: duration),
            child: child,
          )
        : FadeInLeft(
            delay: const Duration(milliseconds: 300),
            duration: Duration(seconds: duration),
            child: child,
          );
  }
}
