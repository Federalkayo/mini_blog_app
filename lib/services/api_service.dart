import 'dart:convert';

import '../models/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async{
  var apiKey = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(apiKey));

  if(response.statusCode == 200){
    final List data =  json.decode(response.body);

    return data.map((json) => Post.fromJson(json)).toList();
  }else{
    throw Exception('Failed to load post');
  }
}

// This is my new chalenge
// HTTP POST

Future<Post> createPost({
  required String title,
  required String body,
  required int userId, 
}) async{
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'title' : title,
      'body' : body,
      'userId' : userId,
    })
  );
  if(response.statusCode == 201){
    return Post.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Failed to create Post');
  }
}