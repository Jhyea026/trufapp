import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/init/splash_screen.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  Future<String> _pegarRotaInicial() async {
    log("Checkando dados a serem pré carregados...");
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      log("Error de inicialização: $e");
    }
    return Routes.login;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _pegarRotaInicial(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offNamed(snapshot.data!);
          });

          return const SizedBox.shrink();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
