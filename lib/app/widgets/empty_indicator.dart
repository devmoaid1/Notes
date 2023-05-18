import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/app_assets.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/spaces.dart';
import 'package:flutter_jsonplaceholder/app/widgets/custom_svg_visual.dart';

class EmptyIndicator extends StatelessWidget {
  final String message;
  const EmptyIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSvgVisual(iconPath: AppAssets.emptyNotes),
        30.vSpace,
        Text(
          message,
          style: context.appTextTheme.bodyMedium,
        )
      ],
    );
  }
}
