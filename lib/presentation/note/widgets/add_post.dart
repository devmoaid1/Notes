import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  String title = "";
  String body = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // Note newPost = Note(
              //   body: body,
              //   title: title,
              //   userId: 1,
              // );
              // if (title.isNotEmpty && body.isNotEmpty) {
              //   di<PostViewModel>().addPost(newPost);
              //   di<PostViewModel>().notes.add(newPost);
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       elevation: 2,
              //       backgroundColor: Theme.of(context).primaryColor,
              //       content: Text(
              //         "Created New Post",
              //         style: GoogleFonts.poppins(
              //             color: Colors.white,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w700),
              //       )));
              // }
              GoRouter.of(context).pop();
              // di<PostViewModel>().getAllPosts();
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            "New Post",
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
                    title = value;
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
                    body = value;
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




// createAddPostDialog(BuildContext context, PostViewModel viewModel) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         String postTitle = "";
//         String postContent = "";
//         return AlertDialog(
//           elevation: 3,
//           backgroundColor: const Color.fromARGB(255, 36, 36, 36),
//           title: Text("Add Post"),
//           titleTextStyle: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
//           content: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.all(5),
//               height: MediaQuery.of(context).size.height * 0.28,
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(bottom: 5, top: 5),
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(189, 239, 239, 255),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: TextField(
//                       onChanged: (value) {
//                         postTitle = value;
//                       },
//                       style: GoogleFonts.poppins(
//                         color: Color.fromARGB(255, 36, 36, 36),
//                         decoration: TextDecoration.none,
//                       ),
//                       maxLines: 1,
//                       decoration: InputDecoration(
//                           enabledBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           contentPadding: EdgeInsets.all(8),
//                           hintText: "Post Title",
//                           hintStyle: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                               color: Color.fromARGB(255, 36, 36, 36))),
//                       controller: TextEditingController(text: ""),
//                     ),
//                   ),
//                   Container(
//                     height: 100,
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(189, 239, 239, 255),
//                         borderRadius: BorderRadius.circular(10)),
//                     margin: EdgeInsets.only(bottom: 5, top: 5),
//                     child: TextField(
//                       onChanged: (value) {
//                         postContent = value;
//                       },
//                       maxLines: 5,
//                       style: GoogleFonts.poppins(
//                         color: Color.fromARGB(255, 36, 36, 36),
//                         decoration: TextDecoration.none,
//                       ),
//                       decoration: InputDecoration(
//                           focusedBorder: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                           contentPadding: EdgeInsets.all(8),
//                           hintText: "Post Content",
//                           hintStyle: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                               color: Color.fromARGB(255, 36, 36, 36))),
//                       controller: TextEditingController(text: ""),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             GestureDetector(
//                 onTap: () {
//                   Post newPost = Post(
//                       id: viewModel.posts.length + 1,
//                       userId: 1,
//                       title: postTitle,
//                       body: postContent);

//                   if (postTitle.isNotEmpty && postContent.isNotEmpty) {
//                     viewModel.addPost(newPost);
//                     //adding post to server or database
//                     viewModel.posts
//                         .add(newPost); // adding post to the list itself
//                   }

//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Confirm",
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )),
//           ],
//         );
//       });
// }
