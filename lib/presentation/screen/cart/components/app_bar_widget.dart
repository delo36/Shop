import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/cart/cart_controller.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller){
      return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            }, icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("Cart",style: TextStyle(color: Colors.black,),),
        actions: [
          IconButton(onPressed: (){
            controller.deleteAllCartItem();
          }, icon: const Icon(Icons.delete_forever),color: Colors.red,)
        ],
      );
    });
  }
}
