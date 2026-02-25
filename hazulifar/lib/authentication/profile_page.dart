import 'package:flutter/material.dart';
import 'package:hazulifar/display/home.dart';
import '../SQLite/sqlite.dart'; // Ensure this path is correct
import 'package:hazulifar/model/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController userIdController;

  final DatabaseHelper _databaseService = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone.toString());
    passwordController = TextEditingController(text: widget.user.password);
    userIdController =
        TextEditingController(text: widget.user.userid.toString());
  }

  Future<void> updateProfile() async {
    if (formKey.currentState!.validate()) {
      var updatedUser = User(
        userid: widget.user.userid,
        name: nameController.text,
        email: emailController.text,
        phone: int.parse(phoneController.text),
        username: widget.user.username,
        password: passwordController.text,
      );

      await _databaseService.updateUser(updatedUser);

      setState(() {
        widget.user.name = nameController.text;
        widget.user.email = emailController.text;
        widget.user.phone = int.parse(phoneController.text);
        widget.user.password = passwordController.text;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  void logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Home()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Name",
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                ),
              ),
              TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone number is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: "Phone",
                ),
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
              ),
              TextFormField(
                controller: userIdController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "User ID is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "User ID",
                ),
              ),
              ElevatedButton(
                onPressed: updateProfile,
                child: const Text("Update Profile"),
              ),
              ElevatedButton(
                onPressed: logout,
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
