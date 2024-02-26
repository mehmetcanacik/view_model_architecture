import 'package:firebase_app/model/firebase_user.dart';
import 'package:firebase_app/service/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserX on User {
  FirebaseUser get toUser => FirebaseUser(
        userId: uid,
        email: email,
        name: displayName,
        photoUrl: photoURL,
      );
}

class AuthService extends IAuthService<FirebaseUser> {
  final FirebaseAuth _instance;

  AuthService({required FirebaseAuth instance}) : _instance = instance;

  @override
  Stream<FirebaseUser?> get currentUser {
    return _instance.authStateChanges().map((user) {
      if (user != null) {
        return FirebaseUser(
          userId: user.uid,
          email: user.email,
          name: user.displayName,
          photoUrl: user.photoURL,
        );
      }
      return null;
    });
  }

  @override
  Future<FirebaseUser> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _instance.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user!.toUser;
    } on FirebaseAuthException catch (authException) {
      throw FirebaseUserException(
          message: authException.message ?? 'Login Exception');
    }
  }

  @override
  Future<FirebaseUser> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _instance.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user!.toUser;
    } on FirebaseAuthException catch (authException) {
      throw FirebaseUserException(
          message: authException.message ?? 'Register Exception');
    }
  }

  @override
  Future<void> signOut() async {
    await _instance.signOut();
  }
}

class FirebaseUserException implements Exception {
  final String message;

  const FirebaseUserException({
    required this.message,
  });
}
