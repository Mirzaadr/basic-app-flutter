import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/features/auth/domain/auth_repository.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user.dart';

class FirebaseAuthRepository implements AuthRepository{
  final FirebaseAuth _auth;
  
  FirebaseAuthRepository(
    this._auth,
    // this._ref,
  );
  
  @override
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges().map((user) => user);
  }

  @override
  User? get currentUser => _auth.currentUser;
  
  @override
  Future<User> signIn(String email, String password) async {
    try {
      final UserCredential response = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return response.user!;
    } catch (e) {
      // print(e.toString());s
      rethrow;
    }
  }
  
  @override
  Future<User> signUp(MyUser myUser, String password) async {
    try {
      UserCredential response = await _auth.createUserWithEmailAndPassword(
        email: myUser.email, 
        password: password
      );

      // myUser = myUser.copyWith(
      //   userId: user.user!.uid,
      // );

      return response.user!;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
  
  @override
  Future<void> setUserData(MyUser myUser) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

}