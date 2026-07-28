import 'dart:async';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/services/auth_services.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final Rxn<User> user = Rxn<User>();

  StreamSubscription<AuthState>? _authSubscription;

  bool get isAuthenticated => user.value != null;

  @override
  void onInit() {
    super.onInit();

    // Verifica se existe uma sessão salva
    user.value = _authService.currentUser;

    // Escuta mudanças na sessão
    _authSubscription = _authService.authStateChanges.listen((data) {
      user.value = data.session?.user;
    });
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  @override
  void onClose() {
    _authSubscription?.cancel();

    super.onClose();
  }
}
