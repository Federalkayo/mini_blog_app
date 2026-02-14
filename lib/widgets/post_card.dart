import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;


  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
             alignment: Alignment.topRight,
             child: Text(
                     'User ${post.userId}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                   ),
             ),

            Text(
              post.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8.0,),

            Text(
              post.body,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700]
              ),
            )
          ],
        ),
      ),
    );
  }
}