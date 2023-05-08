import 'package:flutter/material.dart';

import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../models/note.dart';

class NoteView extends ViewModelWidget<PostViewModel> {
  final Note note;
  const NoteView({
    required this.note,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Center(
            child: Text(
              "Post Number 1",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notes_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: Text(
                        note.title,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                    indent: 40,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: Text(
                        "Moaid Mohamed",
                        maxLines: 3,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 40,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                      child: Text(
                        "this is one of the best  ",
                        maxLines: 20,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
