import 'package:get/get.dart';
import 'package:trufapp/app/init/redirect_page.dart';
import 'package:trufapp/app/pages/dashboard/dashboard.dart';
import 'package:trufapp/app/pages/login/login_page.dart';
import 'package:trufapp/app/pages/select-box/select_box_page.dart';
part 'routes.dart';

class PagesRoutes {
  static final routes = [
    GetPage(name: Routes.initial, page: () => const RedirectPage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.dashboard, page: () => const Dashboard()),
    GetPage(name: Routes.selectBox, page: () => const SelectBoxPage()),
  ];
}
