import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/app_assets.dart';
import 'package:flutter_jsonplaceholder/app/constants/layouts.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/spaces.dart';
import 'package:flutter_jsonplaceholder/app/utils/format_date.dart';
import 'package:flutter_jsonplaceholder/presentation/home/home_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../data/models/note.dart';

class NoteCard extends ViewModelWidget<HomeViewmodel> {
  final Note note;
  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewmodel viewModel) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          color: Colors.red,
          child: SvgPicture.asset(AppAssets.deleteIcon)),
      onDismissed: (direction) {
        viewModel.deleteNote(note);
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return InkWell(
          child: Container(
            width: constraints.maxWidth,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: context.appTheme.cardColor,
              borderRadius: AppLayouts.kdefaultBorderRadius,
            ),
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.6),
                  child: Text(note.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextTheme.bodyLarge),
                ),
                8.h.vSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45.h,
                      width: constraints.maxWidth * 0.6,
                      child: Text(note.body!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.appTextTheme.bodyMedium!
                              .copyWith(color: context.appTheme.hintColor)),
                    ),
                    10.w.hSpace,
                    Text(
                      formatDate(note.createdAt!),
                      style: context.appTextTheme.bodyMedium!
                          .copyWith(color: context.appTheme.hintColor),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
