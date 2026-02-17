import 'package:get/get.dart';
import 'package:trufapp/app/init/redirect_page.dart';
import 'package:trufapp/app/pages/navigation/navigation_page.dart';
import 'package:trufapp/app/pages/login/login_page.dart';
import 'package:trufapp/app/pages/select-box/selectBox.dart';
part 'routes.dart';

class PagesRoutes {
  static final routes = [
    GetPage(name: Routes.initial, page: () => const RedirectPage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.navigationMain, page: () => const NavigationPage()),
    GetPage(name: Routes.selectBox, page: () => const Selectbox()),
  ];
}
