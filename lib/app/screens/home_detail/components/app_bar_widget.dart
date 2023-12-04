import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
      title: const Text(
        "Product Detail",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.cart);
          },
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
