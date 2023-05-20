import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/spaces.dart';
import 'package:flutter_jsonplaceholder/app/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchSection extends StatefulWidget {
  const HomeSearchSection({super.key});

  @override
  State<HomeSearchSection> createState() => _HomeSearchSectionState();
}

class _HomeSearchSectionState extends State<HomeSearchSection> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes', style: context.appTextTheme.headlineLarge),
        30.vSpace,
        CustomTextField(
          textStyle: context.appTextTheme.bodyMedium!,
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
          prefixIcon: Icon(
            Icons.search,
            color: context.appTheme.hintColor,
          ),
          controller: _searchController,
          labelText: 'type note title...',
          onChanged: (value) {},
          onEditingComplete: () {},
          filled: true,
          fillColor: context.appTheme.cardColor,
          labelStyle: context.appTextTheme.bodyMedium!
              .copyWith(color: context.appTheme.hintColor),
        ),
        // TextField(
        //   decoration: InputDecoration(
        //     hintText: 'type note title...',
        //     filled: true,
        //     fillColor: context.appTheme.cardColor,
        //     hintStyle: context.appTextTheme.bodyMedium!
        //         .copyWith(color: context.appTheme.hintColor),
        //     prefixIcon: Icon(
        //       Icons.search,
        //       color: context.appTheme.hintColor,
        //     ),
        //     border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20.0),
        //         borderSide: BorderSide.none),
        //   ),
        // ),
        30.vSpace,
      ],
    );
  }
}
