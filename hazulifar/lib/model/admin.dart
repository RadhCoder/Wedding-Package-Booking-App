import 'dart:convert';

class Admin {
  final int? adminid;
  final String username;
  final String password;

  Admin({
    this.adminid,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'adminid': adminid,
      'username': username,
      'password': password,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      adminid: map['adminid'],
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminModel(adminid: $adminid, username: $username, password: $password)';
  }
}