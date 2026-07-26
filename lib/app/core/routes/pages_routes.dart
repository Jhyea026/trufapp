import 'package:get/get.dart';
import 'package:trufapp/app/init/redirect_page.dart';
import 'package:trufapp/app/pages/autoriza_page/autoriza_page.dart';
import 'package:trufapp/app/pages/home/home_page.dart';
import 'package:trufapp/app/pages/login/login_page.dart';
import 'package:trufapp/app/pages/caixa_selecao/caixa_selecao_page.dart';
import 'package:trufapp/app/pages/registrar_login/register_page.dart';

part 'routes.dart';

class PagesRoutes {
  static final routes = [
    GetPage(name: Routes.initial, page: () => const RedirectPage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.registrar, page: () => const RegisterPage()),
    GetPage(name: Routes.autorizar, page: () => const AutorizaPage()),
    GetPage(name: Routes.dashboard, page: () => const HomePage()),
    GetPage(name: Routes.selectBox, page: () => const SelectBoxPage()),
  ];
}
