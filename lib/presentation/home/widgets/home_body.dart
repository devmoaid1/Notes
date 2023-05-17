import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/layouts.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/spaces.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppLayouts.kScaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notes', style: context.appTextTheme.headlineLarge),
            30.vSpace,
            TextField(
              decoration: InputDecoration(
                hintText: 'type note title...',
                filled: true,
                fillColor: context.appTheme.cardColor,
                hintStyle: context.appTextTheme.bodyMedium!
                    .copyWith(color: context.appTheme.hintColor),
                prefixIcon: Icon(
                  Icons.search,
                  color: context.appTheme.hintColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none),
              ),
            ),
            30.vSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your actual list size
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Note $index'),
                    subtitle: Text('Details of Note $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
