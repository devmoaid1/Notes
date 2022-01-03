import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../app/routing/routes.dart';
import '../posts_viewModel.dart';

class PostCard extends ViewModelWidget<PostViewModel> {
  final int index;
  const PostCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    return InkWell(
      focusColor: Colors.amber,
      highlightColor: Colors.amber,
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 3,
                backgroundColor: const Color.fromARGB(255, 36, 36, 36),
                title: Text("Are you sure you want to delete Post ?"),
                titleTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
                actions: [
                  GestureDetector(
                      onTap: () {
                        viewModel.deletePost(viewModel.post.id);
                        viewModel.posts.removeAt(index);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ],
              );
            });
      },
      onTap: () {
        viewModel.setPost(viewModel.posts[index]);
        Navigator.pushNamed(context, singlePostPage);
      },
      child: Card(
          elevation: 3,
          color: Theme.of(context).backgroundColor,
          margin: const EdgeInsets.only(bottom: 4),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 20, 20),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(viewModel.posts[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Icon(
                              Icons.account_circle,
                              color: Color.fromARGB(235, 216, 21, 69),
                            ),
                          ),
                          Text(
                            viewModel.posts[index].id.toString(),
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(235, 240, 35, 86),
                                fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: Text(viewModel.posts[index].body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
