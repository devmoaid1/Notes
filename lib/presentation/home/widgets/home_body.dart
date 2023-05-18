import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/layouts.dart';
import 'package:flutter_jsonplaceholder/presentation/home/widgets/home_search_section.dart';

import 'notes_listview_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppLayouts.kScaffoldPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeSearchSection(),
              NotesListViewModelBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
