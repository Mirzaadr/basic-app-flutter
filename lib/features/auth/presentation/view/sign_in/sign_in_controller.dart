
import 'package:flutter_application/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> signIn(String email, String password) async {
    final authRepo = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepo.signIn(email, password));
  }

  
}