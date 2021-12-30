import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

// class PostsPage extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   PostsPage({Key? key}) : super(key: key);

//   @override
//   State<PostsPage> createState() => _PostsPageState();
// }

// class _PostsPageState extends State<PostsPage> {
//   final PostViewModel viewModel = PostViewModel();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     viewModel.getAllPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<PostViewModel>(
//       create: (context) => viewModel,
//       child: Consumer<PostViewModel>(
//         builder: (context, value, child) => Scaffold(
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
//       ),
//     );
//   }
// }

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  final PostViewModel viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.nonReactive(
      viewModelBuilder: () => viewModel,
      onModelReady: (model) => model.getAllPosts(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Posts")),
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
      ),
    );
  }
}

class PostCard extends ViewModelWidget<PostViewModel> {
  final int index;
  const PostCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel model) {
    return Card(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        title: Text("${model.posts[index].title}"),
        subtitle: Text("${model.posts[index].body}"),
      ),
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