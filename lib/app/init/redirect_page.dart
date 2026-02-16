import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  Future<String> _getInitialRoute() {
    log("Checkando dados a serem pré carregados...");
    return Future.value(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getInitialRoute(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offNamed(snapshot.data!);
          });

          return const SizedBox.shrink();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
