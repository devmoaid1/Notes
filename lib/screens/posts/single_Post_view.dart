import 'package:flutter/material.dart';

import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SinglePostPage extends ViewModelWidget<PostViewModel> {
  const SinglePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          title: Center(
            child: Text(
              "Post Number ${viewModel.post.id}",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(10),
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
                      margin: EdgeInsets.only(left: 10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: Text(
                        "${viewModel.post.title}",
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
                  margin: EdgeInsets.only(top: 10, bottom: 10),
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
                      margin: EdgeInsets.only(left: 10),
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
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(
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
                      margin: EdgeInsets.only(left: 10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      child: Text(
                        "Agile Methedology is one of the most imponrtant methedology so it aims to reduce risks and projects faliure due to its iterative process ${viewModel.post.body}",
                        maxLines: 3,
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
