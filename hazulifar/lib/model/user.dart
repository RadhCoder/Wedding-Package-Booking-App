import 'dart:convert';

class User {
  int? userid;
  String name;
  String email;
  int phone;
  String username;
  String password;

  User({
    this.userid,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'name': name,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userid: map['userid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  // Setter methods for name, email, phone, and password
  void setName(String newName) {
    name = newName;
  }

  void setEmail(String newEmail) {
    email = newEmail;
  }

  void setPhone(int newPhone) {
    phone = newPhone;
  }

  void setPassword(String newPassword) {
    password = newPassword;
  }

  @override
  String toString() {
    return 'UserModel(userid: $userid, name: $name, email: $email, phone: $phone, username: $username, password: $password)';
  }
}