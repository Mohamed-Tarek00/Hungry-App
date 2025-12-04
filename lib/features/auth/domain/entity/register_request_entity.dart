class RegisterRequestEntity {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterRequestEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'phone': phone, 'password': password};
  }
}
