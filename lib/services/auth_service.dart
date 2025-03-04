import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Đăng ký tài khoản
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Thành công
    } catch (e) {
      return e.toString(); // Lỗi
    }
  }

  // Đăng nhập
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Thành công
    } catch (e) {
      return e.toString(); // Lỗi
    }
  }

  // Đăng xuất
  Future<void> logout() async {
    await _auth.signOut();
  }
}
