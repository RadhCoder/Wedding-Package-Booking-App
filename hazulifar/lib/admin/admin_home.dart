import 'package:flutter/material.dart';
import 'package:hazulifar/admin/user_lists.dart';

class AdminHomePage extends StatelessWidget {
  final Map<String, dynamic> admin;

  AdminHomePage({Key? key, required this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(admin); // Add this line to check the contents of the admin map
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, Admin!'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => UserList()),
                );
              },
              child: const Text('View User List'),
            ),
          ],
        ),
      ),
    );
  }
}
