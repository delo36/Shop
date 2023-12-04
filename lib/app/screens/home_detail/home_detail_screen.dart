import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/screens/home_detail/components/app_bar_widget.dart';
import 'package:shop_mobile/app/screens/home_detail/components/related_product_widget.dart';

import 'components/product_info_widget.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: AppBarWidget()),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ProductInfoWidget(),
          ),
        ));
  }
}
