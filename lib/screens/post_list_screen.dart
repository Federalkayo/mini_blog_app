import 'package:flutter/material.dart';
import 'package:mini_blog_app/models/post_model.dart';
import 'package:mini_blog_app/services/api_service.dart';
import 'package:mini_blog_app/widgets/add_post_dialog.dart';
import 'package:mini_blog_app/widgets/post_card.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPost();
  }

  Future<void> _openAddPostDialog() async {
  final result = await showDialog(
    context: context,
    builder: (_) => const AddPostDialog(),
  );

  if (result == true) {
    setState(() {
      _postsFuture = fetchPost();
    });
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Blog'),
      ),
      body: FutureBuilder(
        future: _postsFuture,
        
        builder: (BuildContext context,  snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: Text('Failed to load blogs'));
          }
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return PostCard(post: posts[index]);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
      onPressed: _openAddPostDialog,
      child: const Icon(Icons.add),
    ),
    );
  }
}