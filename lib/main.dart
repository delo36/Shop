import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/presentation/getx/login/otp/otp_binding.dart';
import 'core/routes/app_pages.dart';

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
        initialRoute: Routes.phoneOtp,
        getPages: AppRoutes.routes
    );
  }
}
