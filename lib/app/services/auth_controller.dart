import 'dart:async';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/services/auth_services.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final Rxn<User> user = Rxn<User>();

  StreamSubscription<AuthState>? _authSubscription;

  bool get isAuthenticated => user.value != null;

  @override
  void onInit() {
    super.onInit();

    user.value = _authService.currentUser;

    _authSubscription = _authService.authStateChanges.listen((data) {
      user.value = data.session?.user;
    });
    ever(user, (User? u) {
      if (u != null) {
        Get.offAllNamed(Routes.dashboard);
      }
    });
  }

  Future<void> logout() async {
    await _authService.logout();
    Get.offNamed(Routes.initial);
  }

  @override
  void onClose() {
    _authSubscription?.cancel();

    super.onClose();
  }
}
