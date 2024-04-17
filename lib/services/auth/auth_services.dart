import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password -----------LOGIN
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  // register with email and password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> logout() async {
    try {
      return await _auth.signOut();
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
