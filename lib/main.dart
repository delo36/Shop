import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/screens/home/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        initialRoute: Routes.home,
        initialBinding: HomeBinding(),
        getPages: AppRoutes.routes
    );
  }
}
