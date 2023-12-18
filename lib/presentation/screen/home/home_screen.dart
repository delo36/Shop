import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: GreetingWidget(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            FirstLevelWidget(),
            SizedBox(
              height: 8,
            ),
            SecondLevelWidget(),
            ProductWidget()
          ],
        ),
      ),
    );
  }
}
