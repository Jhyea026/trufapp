import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/init/redirect_page.dart';
import 'package:trufapp/app/pages/login/login.dart';
part 'routes.dart';

class PagesRoutes {
  static final routes = [
    GetPage(name: Routes.initial, page: () => const RedirectPage()),
    GetPage(name: Routes.login, page: () => const Login()),
    GetPage(name: Routes.home, page: () => const Placeholder()),
    GetPage(name: Routes.selectBox, page: () => const Placeholder()),
  ];
}
