import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PagesRoutes.routes,
      initialRoute: Routes.initial,
    );
  }
}
