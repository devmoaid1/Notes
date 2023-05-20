import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback onEditingComplete;
  final bool hasBorder;
  final bool filled;
  final Color fillColor;
  final Icon? prefixIcon;
  final int? maxLines;
  final double? cursorHeight;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.labelStyle,
      this.textStyle,
      this.contentPadding,
      this.keyboardType,
      required this.onChanged,
      required this.onEditingComplete,
      this.hasBorder = true,
      required this.filled,
      required this.fillColor,
      this.maxLines,
      this.prefixIcon,
      this.cursorHeight,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      style: textStyle,
      cursorColor: context.appTheme.primaryColor,
      cursorWidth: 3,
      cursorHeight: cursorHeight ?? 20,
      maxLines: maxLines,
      decoration: hasBorder
          ? InputDecoration(
              hintText: labelText,
              prefixIcon: prefixIcon,
              filled: filled,
              fillColor: fillColor,
              hintStyle: labelStyle,
              contentPadding: contentPadding,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            )
          : InputDecoration(
              hintText: labelText,
              prefixIcon: prefixIcon,
              hintStyle: labelStyle,
              contentPadding: contentPadding,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
    );
  }
}
