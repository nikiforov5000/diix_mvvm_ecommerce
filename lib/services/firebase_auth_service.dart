import 'package:diix_mvvm_ecommerce/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseAuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        return User(
          uid: authResult.user!.uid,
          email: authResult.user!.email!,
        );
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
