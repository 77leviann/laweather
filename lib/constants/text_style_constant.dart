import 'package:flutter/material.dart';

class TextStyleConstant {
  static TextStyle? titleOnboarding(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onBackground);
  }

  static TextStyle? bodyOnboarding(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground);
  }

  static TextStyle? footerOnboarding(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary);
  }
}
