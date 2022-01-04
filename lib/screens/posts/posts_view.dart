import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';

import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:stacked/stacked.dart';

import 'widgets/add_post.dart';
import 'widgets/post_card.dart';

class PostsPage extends ViewModelWidget<PostViewModel> {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 3,
            floating: true,
            snap: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    // createAddPostDialog(context, viewModel);
                    Navigator.pushNamed(context, addPostPage);
                  },
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 36, 36, 36)),
                    margin: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "Add Post",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("List of Posts",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              centerTitle: false,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(index: index),
              );
            }, childCount: viewModel.posts.length),
          )
        ],
      ),
    );
  }
}
