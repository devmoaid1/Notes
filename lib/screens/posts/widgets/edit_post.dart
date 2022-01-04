import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../models/Post.dart';

class EditPostPage extends ViewModelWidget<PostViewModel> {
  EditPostPage({Key? key}) : super(key: key);

  String newTitle = '';
  String newBody = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    Post currentPost = viewModel.post;
    titleController.text = currentPost.title;
    bodyController.text = currentPost.body;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              if (newBody.isNotEmpty || newTitle.isNotEmpty) {
                if (newTitle.isNotEmpty) {
                  Post newPost = Post(title: newTitle, body: currentPost.body);

                  viewModel.updatePost(currentPost.id, newPost);
                  currentPost.title = newTitle;

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      elevation: 2,
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text(
                        "Updated  Post",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )));
                }

                if (newBody.isNotEmpty) {
                  Post newPost = Post(title: currentPost.title, body: newBody);

                  viewModel.updatePost(currentPost.id, newPost);
                  currentPost.body = newBody;

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      elevation: 2,
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text(
                        "Updated  Post",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )));
                }

                if (newTitle.isNotEmpty && newBody.isNotEmpty) {
                  Post newPost = Post(title: newTitle, body: newBody);

                  viewModel.updatePost(currentPost.id, newPost);
                  currentPost = Post(
                      body: newBody,
                      title: newTitle,
                      id: currentPost.id,
                      userId: 1);
                }
              }
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
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
              Container(
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
              Container(
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
                  decoration: InputDecoration(
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
