import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/features/auth/repository/auth_repository.dart';
import 'package:wemace/core/utils.dart';
import 'package:wemace/models/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.watch(AuthRepositoryProvider), ref: ref));

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); //Loading Part

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final User = await _authRepository.signInWithGoogle();
    state = false;
    User.fold(
        (l) => showSnackBar(context, l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }
}
