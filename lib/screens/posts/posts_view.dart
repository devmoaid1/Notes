import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:flutter_jsonplaceholder/screens/posts/single_Post_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stacked/stacked.dart';

import '../../models/Post.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  final PostViewModel viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        onModelReady: (model) => model.getAllPosts(),
        builder: (context, model, _) {
          if (model.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (model.error.isNotEmpty) {
            return Center(
              child: Text(model.error),
            );
          }
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Post newPost = Post(
                    id: model.posts.length + 1,
                    title: "new Post",
                    userId: 1,
                    body: "new Post Body");

                model.addPost(newPost);
              },
              child: Icon(Icons.add),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
              title: const Center(child: Text("Posts")),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(
                  index: index,
                ),
              ),
              itemCount: model.posts.length,
            ),
          );
        });
  }
}

class PostCard extends ViewModelWidget<PostViewModel> {
  final int index;
  const PostCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.setPostID(index + 1);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewModelBuilder<PostViewModel>.nonReactive(
                  viewModelBuilder: () => viewModel,
                  builder: (context, viewModel, _) => const SinglePostPage()),
            ));
      },
      child: Card(
          elevation: 3,
          color: Theme.of(context).backgroundColor,
          margin: const EdgeInsets.only(bottom: 2),
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



// Scaffold(
//           appBar: AppBar(
//             title: Center(child: Text("Posts")),
//           ),
//           body: ListView.builder(
//             itemBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 margin: EdgeInsets.only(bottom: 5),
//                 child: ListTile(
//                   title: Text("${value.posts[index].title}"),
//                   subtitle: Text("${value.posts[index].body}"),
//                 ),
//               ),
//             ),
//             itemCount: value.posts.length,
//           ),
//         ),