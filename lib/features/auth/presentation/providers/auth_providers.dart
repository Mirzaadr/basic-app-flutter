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

// @riverpod
// class AuthNotifier extends _$AuthNotifier {
//   late AuthRepository _dataSource;

//   @override
//   AuthenticationState build() {
//     _dataSource = ref.watch(authRepositoryProvider);
//     return const AuthenticationState.initial();
//     // ok to leave this empty if the return type is FutureOr<void>
//   }

//   Future<void> login({required String email, required String password}) async {
//     state = const AuthenticationState.loading();
//     // final response = await _dataSource.signIn(email, password);
//     // state = response.fold(
//     //   (error) => AuthenticationState.unauthenticated(message: error),
//     //   (response) => AuthenticationState.authenticated(user: response!),
//     // );
//     try {
//       final user = await _dataSource.signIn(email, password);
//       state = AuthenticationState.authenticated(user: user);
//     } catch (e) {
//       state = AuthenticationState.unauthenticated(message: e.toString());
//     }
//   }

//   Future<void> signup({required MyUser myUser, required String password}) async {
//     state = const AuthenticationState.loading();
//     // final response = await _dataSource.signUp(email: email, password: password);
//     // state = response.fold(
//     //   (error) => AuthenticationState.unauthenticated(message: error),
//     //   (response) => AuthenticationState.authenticated(user: response),
//     // );
//     try {
//       final response = await _dataSource.signUp(myUser, password);
//       state = AuthenticationState.authenticated(user: response);
//     } catch (e) {
//       state = AuthenticationState.unauthenticated(message: e.toString());
//     }
//   }

//   // Future<void> continueWithGoogle() async {
//   //   state = const AuthenticationState.loading();
//   //   final response = await _dataSource.continueWithGoogle();
//   //   state = response.fold(
//   //     (error) => AuthenticationState.unauthenticated(message: error),
//   //     (response) => AuthenticationState.authenticated(user: response),
//   //   );
//   // }
// }
