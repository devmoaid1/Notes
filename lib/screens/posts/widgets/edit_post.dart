import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/note.dart';
import 'package:google_fonts/google_fonts.dart';

class EditNoteView extends StatefulWidget {
  final Note note;
  const EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String newTitle = '';
  String newBody = '';
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    bodyController = TextEditingController(text: widget.note.body);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              //   if (newBody.isNotEmpty || newTitle.isNotEmpty) {
              //     if (newTitle.isNotEmpty) {
              //       Note newPost = Note(title: newTitle, body: currentPost.body);

              //       viewModel.updatePost(currentPost.id, newPost);
              //       currentPost.title = newTitle;

              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           elevation: 2,
              //           backgroundColor: Theme.of(context).primaryColor,
              //           content: Text(
              //             "Updated  Post",
              //             style: GoogleFonts.poppins(
              //                 color: Colors.white,
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w700),
              //           )));
              //     }

              //     if (newBody.isNotEmpty) {
              //       Note newPost = Note(title: currentPost.title, body: newBody);

              //       viewModel.updatePost(currentPost.id, newPost);
              //       currentPost.body = newBody;

              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           elevation: 2,
              //           backgroundColor: Theme.of(context).primaryColor,
              //           content: Text(
              //             "Updated  Post",
              //             style: GoogleFonts.poppins(
              //                 color: Colors.white,
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w700),
              //           )));
              //     }

              //     if (newTitle.isNotEmpty && newBody.isNotEmpty) {
              //       Note newPost = Note(title: newTitle, body: newBody);

              //       viewModel.updatePost(currentPost.id, newPost);
              //       // currentPost = Post(
              //       //     body: newBody,
              //       //     title: newTitle,
              //       //     id: currentPost.id,
              //       //     userId: 1);
              //     }
              //   }
              //   Navigator.pop(context);
              // },
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            "Edit Post",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  onChanged: (value) {
                    newTitle = value;
                  },
                  maxLines: 1,
                  maxLength: 50,
                  controller: titleController,
                  cursorColor: Theme.of(context).primaryColor,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey[300],
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  onChanged: (value) {
                    newBody = value;
                    print(newBody);
                  },
                  maxLines: 10,
                  controller: bodyController,
                  cursorColor: Theme.of(context).primaryColor,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
