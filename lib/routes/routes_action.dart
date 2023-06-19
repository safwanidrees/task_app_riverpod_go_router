import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesAction {
  RoutesAction._();
  static final instance = RoutesAction._();
  onPush(BuildContext context, String route) {
    context.go(route);
  }

  onBack(
    BuildContext context,
  ) {
    context.pop();
  }
}
