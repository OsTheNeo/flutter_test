class AuthRepository {
  Future<bool> login(String email, String password) async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    // For demonstration purposes, consider any non-empty email and password as valid
    return email.isNotEmpty && password.isNotEmpty;
  }

  Future<void> logout() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 1));
  }
}
