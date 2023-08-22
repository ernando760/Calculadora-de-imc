import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get background => Theme.of(this).colorScheme.background;
}
