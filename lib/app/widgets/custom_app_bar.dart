import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        20.w.hSpace,
        Text(title, style: context.appTextTheme.headlineLarge!)
      ],
    );
  }
}
