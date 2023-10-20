import 'dart:convert';

class Secret {
  String secret;
  String author;

  Secret({
    required this.secret,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'secret': secret,
      'author': author,
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      secret: map['secret'] as String,
      author: map['author'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) => Secret.fromMap(json.decode(source) as Map<String, dynamic>);


}