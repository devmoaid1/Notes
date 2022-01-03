import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/Post.dart';
import '../posts_viewModel.dart';

createAddPostDialog(BuildContext context, PostViewModel viewModel) {
  return showDialog(
      context: context,
      builder: (context) {
        String postTitle = "";
        String postContent = "";
        return AlertDialog(
          elevation: 3,
          backgroundColor: const Color.fromARGB(255, 36, 36, 36),
          title: Text("Add Post"),
          titleTextStyle: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          content: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.28,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(189, 239, 239, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      onChanged: (value) {
                        postTitle = value;
                      },
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 36, 36, 36),
                        decoration: TextDecoration.none,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Post Title",
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 36, 36, 36))),
                      controller: TextEditingController(text: ""),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(189, 239, 239, 255),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    child: TextField(
                      onChanged: (value) {
                        postContent = value;
                      },
                      maxLines: 5,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 36, 36, 36),
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Post Content",
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 36, 36, 36))),
                      controller: TextEditingController(text: ""),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Post newPost = Post(
                      id: viewModel.posts.length + 1,
                      userId: 1,
                      title: postTitle,
                      body: postContent);

                  viewModel.addPost(newPost);
                  //adding post to server or database
                  viewModel.posts
                      .add(newPost); // adding post to the list itself

                  Navigator.of(context).pop();
                },
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ],
        );
      });
}
