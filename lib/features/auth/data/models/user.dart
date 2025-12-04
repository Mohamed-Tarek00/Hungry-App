class User {
  final String token;
  final String name;
  final String email;
  final String image;

  User({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'name': name, 'email': email, 'image': image};
  }
}
