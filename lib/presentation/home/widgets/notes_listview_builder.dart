import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/widgets/empty_indicator.dart';
import 'package:stacked/stacked.dart';

import '../home_viewmodel.dart';
import 'notes_list.dart';

class NotesListViewModelBuilder extends ViewModelWidget<HomeViewmodel> {
  const NotesListViewModelBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewmodel viewModel) {
    if (viewModel.isBusy) {
      return SizedBox(
        height: context.screenHeight * 0.70,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    if (viewModel.hasError) {
      return Center(
          child: Text(
        viewModel.modelError,
        style: context.appTextTheme.bodyMedium,
      ));
    }

    if (viewModel.filteredNotes.isNotEmpty) {
      // search is on render search
      return NotesList(notes: viewModel.filteredNotes);
    } else {
      // render original notes if no search
      if (viewModel.notes.isEmpty) {
        return SizedBox(
          height: context.screenHeight * 0.70,
          child: const Center(
            child: EmptyIndicator(
                message: 'Unleash your ideas. Start by adding a note'),
          ),
        );
      } else {
        return NotesList(notes: viewModel.notes);
      }
    }
  }
}
