import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/widgets/empty_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../../app/di/dependency.dart';
import '../home_viewmodel.dart';
import 'notes_list.dart';

class NotesListViewModelBuilder extends StatelessWidget {
  const NotesListViewModelBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
        viewModelBuilder: () => di<HomeViewmodel>(),
        createNewViewModelOnInsert: false,
        fireOnViewModelReadyOnce: true,
        onViewModelReady: (viewModel) => viewModel.getAllNotes(),
        builder: (context, viewModel, child) {
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

          if (viewModel.notes.isEmpty) {
            return SizedBox(
              height: context.screenHeight * 0.70,
              child: const Center(
                child: EmptyIndicator(
                    message: 'Unleash your ideas. Start by adding a note'),
              ),
            );
          } else {
            return Expanded(
              child: NotesList(notes: viewModel.notes),
            );
          }
        });
  }
}
