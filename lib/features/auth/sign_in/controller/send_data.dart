class SendData {
  final String email;
  final String password;

  SendData({
    required this.email,
    required this.password,
  });
  bool get isValid {
    return email.isNotEmpty && password.isNotEmpty;
  }

  Map<String, dynamic> toJson() {
    return {
      "phone": email,
      "password": password,
    };
  }

  @override
  String toString() {
    return 'sendData{email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SendData &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
