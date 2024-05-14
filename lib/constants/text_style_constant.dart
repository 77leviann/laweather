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

  static TextStyle? errorStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.error);
  }

  static TextStyle? displayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary);
  }

  static TextStyle? headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary);
  }

  static TextStyle? headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary);
  }

  static TextStyle? bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground);
  }

  static TextStyle? labelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary);
  }
}
