import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/features/auth/repository/auth_repository.dart';
import 'package:wemace/core/utils.dart';

final AuthControllerProvider = Provider(
    (ref) => AuthController(authRepository: ref.read(AuthRepositoryProvider)));

class AuthController {
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle(BuildContext context) async {
    final User = await _authRepository.signInWithGoogle();
    User.fold((l) => showSnackBar(context, l.message), (r) => null);
  }
}
