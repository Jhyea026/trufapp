import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/services/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();

    if (!authController.isAuthenticated) {
      return const RouteSettings(name: Routes.initial);
    }
    return null;
  }
}

class GuestMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();

    if (authController.isAuthenticated) {
      return const RouteSettings(name: Routes.dashboard);
    }
    return null;
  }
}
