import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/app_assets.dart';
import 'package:flutter_jsonplaceholder/app/constants/layouts.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/presentation/home/home_viewmodel.dart';
import 'package:flutter_jsonplaceholder/presentation/home/widgets/home_search_section.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../app/di/dependency.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppLayouts.kScaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeSearchSection(),
            NotesListViewModelBuilder(),
          ],
        ),
      ),
    );
  }
}

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
            return const Center(
              child: CircularProgressIndicator.adaptive(),
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
            return Center(
              child: SvgPicture.asset(AppAssets.emptyNotes),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: viewModel
                    .notes.length, // Replace with your actual list size
                itemBuilder: (BuildContext context, int index) {
                  final note = viewModel.notes[index];
                  return ListTile(
                    title: Text('Note $index'),
                    subtitle: Text('Details of Note ${note.body}'),
                  );
                },
              ),
            );
          }
        });
  }
}
