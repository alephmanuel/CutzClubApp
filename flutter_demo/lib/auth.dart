import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  
  /* ⁡⁢⁣⁣User Instanciations⁡ */
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser =>_firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /* ⁡⁢⁣⁣Sign in user ⁡⁢⁣⁣with the required arguments.⁡⁡ */
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  /* ⁡⁢⁣⁣Create user with the required arguments.⁡ */
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    /* ⁡⁢⁣⁣Wait⁡ for the email and password ⁡⁢⁣⁣to be registered⁡.⁡ */
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  /* Functionality for the ⁡⁢⁣⁣user to be able to sign out⁡. */
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}