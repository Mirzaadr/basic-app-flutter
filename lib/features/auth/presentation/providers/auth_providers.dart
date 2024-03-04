import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/core/providers/firebase_providers.dart';
import 'package:flutter_application/features/auth/data/firebase_auth_repository.dart';
// import 'package:flutter_application/features/auth/domain/auth_repository.dart';
// import 'package:flutter_application/features/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuthRepository authRepository(AuthRepositoryRef ref) {
  return FirebaseAuthRepository(ref.watch(firebaseAuthProvider));
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}
