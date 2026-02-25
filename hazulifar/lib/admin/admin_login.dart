import 'package:flutter/material.dart';
import 'package:hazulifar/admin/admin_home.dart';
import 'package:hazulifar/model/admin.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _adminIdController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _isRegistering = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _adminIdController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _adminIdController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegistering ? 'Register' : 'Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isRegistering)
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _adminIdController,
                  decoration: const InputDecoration(
                    labelText: 'Admin ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your admin ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                if (_isRegistering)
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                      }
                    },
                    child: Text(_isRegistering ? 'Register' : 'Login'),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _isRegistering = !_isRegistering;
                      });
                    },
                    child: Text(_isRegistering
                        ? 'Already have an account? Login here'
                        : 'Don\'t have an account? Register here'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final username = _usernameController.text;
    final adminId = int.tryParse(_adminIdController.text); // Assuming adminId is an integer
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (!_isRegistering ||
        (username.isNotEmpty &&
            adminId != null &&
            password.isNotEmpty &&
            password == confirmPassword)) {
      // Create an instance of Admin with the entered data
      final admin = Admin(
        adminid: adminId,
        username: username,
        password: password,
      );

      // Navigate to the AdminHomePage with the admin instance
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminHomePage(admin: admin.toMap())),
      );
    } else {
      // Show an error message if registration fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid admin ID, password, or passwords do not match')),
      );
    }
  }
}
