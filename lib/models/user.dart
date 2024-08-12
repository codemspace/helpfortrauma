// lib/models/user.dart

class User {
  final String email;
  final String password;
  final String otp;

  User({
    required this.email,
    required this.password,
    required this.otp,
  });

  // List of static users for testing
  static final List<User> users = [
    User(email: 'topmsdev@outlook.com', password: 'password123', otp: '1234'),
  ];

  // Finds a user by email, returning null if not found
  static User? findByEmail(String email) {
    try {
      return users.firstWhere((user) => user.email == email);
    } catch (e) {
      return null; // Return null if no user is found
    }
  }

  // Verifies the OTP for a given email
  static bool verifyOtp(String email, String otp) {
    final user = findByEmail(email);
    return user != null && user.otp == otp;
  }
}
