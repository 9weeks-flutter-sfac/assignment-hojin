class User {
  String id;
  String username;
  String email;
  String name;
  String avatar;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'],
    );
  }
}

