
import 'package:flutter_application/features/auth/domain/user.dart';
import 'package:flutter_application/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> signUp(MyUser myUser, String password) async {
    final authRepo = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepo.signUp(myUser, password));
  }

  
}