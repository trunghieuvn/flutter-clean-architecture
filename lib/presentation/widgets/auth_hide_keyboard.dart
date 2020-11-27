import 'package:flutter/material.dart';

class AutoHideKeyboard extends StatelessWidget {
  final Widget child;

  const AutoHideKeyboard({
    @required this.child,
  }) : assert(child != null, 'Child not null');

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return GestureDetector(
      key: const ValueKey('widget_AutoHideKeyboard'),
      onTap: hideKeyboard,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
