
class Post {
  final String userId;
  final String title;
  final String body;

  Post(
    {
      required this.userId,
      required this.title,
      required this.body
    }
  );
  factory Post.fromJson(Map <String, dynamic> json){
    return Post(
      userId: json['userId'],
      title: json['title'],
      body: json['body']
    );
  }

}
