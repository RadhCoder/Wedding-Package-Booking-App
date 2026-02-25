import 'package:flutter/material.dart';
import 'package:hazulifar/display/home.dart';
import '../SQLite/sqlite.dart'; // Assuming this is your SQLite database helper
import '../model/user.dart'; // Assuming this is your User model

class UpdateUserPage extends StatefulWidget {
  final User? user; // Make user nullable

  UpdateUserPage({Key? key, this.user}) : super(key: key);

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late User user;

  @override
  void initState() {
    super.initState();
    // Initialize the user object here
    user = User(
        name: '',
        email: '',
        phone: 0,
        username: '',
        password: ''); // Or any default user object you prefer
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone.toString());
    usernameController = TextEditingController(text: user.username);
    passwordController = TextEditingController(text: user.password);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update User'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _confirmDelete,
              child: Text('Delete User'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUser() async {
    user.setName(nameController.text);
    user.setEmail(emailController.text);
    user.setPhone(int.parse(phoneController.text));
    user.setPassword(passwordController.text);

    int rowsAffected = await DatabaseHelper().updateUser(user);
    if (rowsAffected > 0) {
      print('User information updated successfully!');
      Navigator.pop(context);
    } else {
      print('Failed to update user information!');
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this user?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _deleteUser,
            child: Text('Delete'),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }

  void _deleteUser() async {
    Navigator.pop(context); // Close the confirmation dialog

    if (user.userid != null) {
      int rowsAffected = await DatabaseHelper().deleteUser(user.userid!);
      if (rowsAffected > 0) {
        print('User deleted successfully!');
        Navigator.pop(context); // Close the update page
      } else {
        print('Failed to delete user!');
      }
    } else {
      print('Error: UserId is null');
    }
  }
}
