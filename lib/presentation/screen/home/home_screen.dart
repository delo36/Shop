import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/util/constants.dart';
import '../../constants/material_design_indicator.dart';
import '../../values/colors.dart';
import 'components/first_level_widget.dart';
import 'components/greeting_widget.dart';
import 'components/product_widget.dart';
import 'components/search_widget.dart';
import 'components/second_level_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> images = [
    Constants.dummyImage,
    'https://placekitten.com/201/301',
    'https://placekitten.com/202/302',
    'https://placekitten.com/203/303',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Column(
          children: [
            GreetingWidget(),
            SearchWidget(),
            FirstLevelWidget(),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[

          SliverList(
            delegate: SliverChildListDelegate(
              [

                SecondLevelWidget(),
                ProductWidget()

              ],
            ),
          ),
        ],
      ),
    );
  }
}
