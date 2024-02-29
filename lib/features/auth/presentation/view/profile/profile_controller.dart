import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {  
  @override
  FutureOr<void> build() {
    
  }

  User? get currentUser => ref.watch(authRepositoryProvider).currentUser;

  Future<void> signOut() async {
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.logout());
  }
}