import 'package:flutter/material.dart';
import 'package:mini_blog_app/screens/post_list_screen.dart';

void main(){
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PostListScreen(),);
  }
}