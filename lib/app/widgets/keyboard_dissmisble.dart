import 'package:flutter/material.dart';

class KeyboardDissmisable extends StatelessWidget {
  final Widget child;
  const KeyboardDissmisable({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
