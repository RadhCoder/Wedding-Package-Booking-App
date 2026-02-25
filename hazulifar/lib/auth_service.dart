// auth_service.dart
class AuthService {
  bool isLoggedIn = false;

  Future<void> login() async {
    // Simulate a delay for login process
    await Future.delayed(Duration(seconds: 1));
    isLoggedIn = true;
  }

  Future<void> register() async {
    // Simulate a delay for registration process
    await Future.delayed(Duration(seconds: 1));
    isLoggedIn = true;
  }
}
