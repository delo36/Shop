import 'package:flutter/material.dart';
import 'package:shop_mobile/app/values/colors.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: const Text(
        "Shop",
        style: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.black, fontSize: 28),
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
