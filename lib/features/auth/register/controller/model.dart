class RegisterModel {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };
}
