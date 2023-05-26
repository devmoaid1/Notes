import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/layouts.dart';
import 'package:flutter_jsonplaceholder/presentation/home/home_viewmodel.dart';
import 'package:flutter_jsonplaceholder/presentation/home/widgets/home_search_section.dart';
import 'package:stacked/stacked.dart';

import '../../../app/di/dependency.dart';
import 'notes_listview_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppLayouts.kScaffoldPadding,
        child: SingleChildScrollView(
          child: ViewModelBuilder<HomeViewmodel>.reactive(
              viewModelBuilder: () => di<HomeViewmodel>(),
              createNewViewModelOnInsert: false,
              fireOnViewModelReadyOnce: true,
              onViewModelReady: (viewModel) => viewModel.getAllNotes(),
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSearchSection(homeViewModel: viewModel),
                    const NotesListViewModelBuilder(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
