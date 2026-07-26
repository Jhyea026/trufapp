import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/services/auth_services.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> login() async {
    if (isLoading.value) return;

    final login = loginController.text.trim();
    final password = passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      Get.snackbar('Atenção', 'Preencha o usuário/e-mail e a senha.');

      return;
    }

    try {
      isLoading.value = true;

      await _authService.login(login: login, password: password);

      Get.offNamed(Routes.selectBox);
    } on AuthException catch (e) {
      Get.snackbar('Erro ao entrar', e.message);
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível realizar o login.');
    } finally {
      isLoading.value = false;
    }
  }
}
