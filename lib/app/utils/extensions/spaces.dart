import 'package:flutter/material.dart';

extension Spaces on num {
  SizedBox get vSpace => SizedBox(
        height: toDouble(),
      ); // vertical space
  SizedBox get hSpace => SizedBox(
        width: toDouble(),
      ); // horizontal space
}
