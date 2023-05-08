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
      focusColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      onLongPress: () {
        viewModel.setPost(viewModel.posts[index]);
        Navigator.pushNamed(context, editPostPage);
      },
      onTap: () {
        viewModel.setPost(viewModel.posts[index]);
        Navigator.pushNamed(context, singlePostPage);
      },
      child: Dismissible(
        key: ObjectKey(viewModel.posts[index]),
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) {
          final currentPost = viewModel.posts[index];
          viewModel.deletePost(currentPost.id);
          viewModel.posts.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Item Deleted",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            backgroundColor: const Color.fromARGB(255, 20, 20, 20),
            action: SnackBarAction(
              label: "undo",
              onPressed: () {
                viewModel.addPost(currentPost);
                viewModel.posts.insert(index, currentPost);
              },
            ),
          ));
        },
        child: Card(
            elevation: 3,
            color: Theme.of(context).colorScheme.background,
            margin: const EdgeInsets.only(bottom: 4),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 20, 20),
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
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.5),
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
                                color: Color.fromARGB(255, 224, 52, 95),
                              ),
                            ),
                            Text(
                              viewModel.posts[index].id.toString(),
                              style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 224, 52, 95),
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
      ),
    );
  }
}
