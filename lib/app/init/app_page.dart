import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/utils/noScroll_component.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: NoScrollbarBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      getPages: PagesRoutes.routes,
      initialRoute: Routes.initial,
    );
  }
}
