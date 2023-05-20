import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/presentation/note/viewmodels/add_note_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../app/di/dependency.dart';
import '../../../app/widgets/custom_text_field.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  String title = "";
  String body = "";
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SingleChildScrollView(
        child: ViewModelBuilder<AddNoteViewModel>.nonReactive(
          onViewModelReady: (viewModel) => viewModel.onInit(),
          fireOnViewModelReadyOnce: true,
          builder: (BuildContext context, AddNoteViewModel viewModel,
              Widget? child) {
            return Column(
              children: [
                CustomTextField(
                  hasBorder: false,
                  cursorHeight: 30,
                  maxLines: 1,
                  controller: _titleController,
                  labelText: 'Title',
                  onChanged: (value) {
                    title = value;
                  },
                  onEditingComplete: () {
                    viewModel.onTitleCompleted(title);
                  },
                  labelStyle: context.appTextTheme.headlineLarge!
                      .copyWith(color: context.appTheme.cardColor),
                  filled: false,
                  fillColor: Colors.transparent,
                  textStyle: context.appTextTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                CustomTextField(
                  hasBorder: false,
                  controller: _bodyController,
                  labelText: '',
                  onChanged: (value) {
                    body = value;
                  },
                  onSubmitted: (value) => viewModel.onBodyCompleted(value),
                  onEditingComplete: () {
                    viewModel.onBodyCompleted(body);
                  },
                  labelStyle: context.appTextTheme.headlineLarge!
                      .copyWith(color: context.appTheme.cardColor),
                  filled: false,
                  fillColor: Colors.transparent,
                  textStyle: context.appTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
          viewModelBuilder: () => di<AddNoteViewModel>(),
        ),
      ),
    );
  }
}
