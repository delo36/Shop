import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx/cart/cart_controller.dart';
import 'components/app_bar_widget.dart';
import 'components/cart_info_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return const Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60), child: AppBarWidget()),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: CartInfoWidget(),
          ));
    });
  }
}
