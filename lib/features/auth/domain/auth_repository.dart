import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/features/auth/domain/user.dart';

abstract class AuthRepository {
  Stream<User?> authStateChanges();

  User? get currentUser;

  Future<User> signUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser myUser);

  Future<User> signIn(String email, String password);

  Future<void> logout();

}