class Post {
  String title;
  String body;
  int id;
  int userId;

  Post({required this.title,
    required this.body,
    required this.id,
    required this.userId});

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      body: map['body'],
      id: map['id'],
      title: map['title'],
      userId: map['userId'],
    );
  }
}