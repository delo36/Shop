import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop_mobile/app/screens/cart/cart_binding.dart';
import 'package:shop_mobile/app/screens/cart/cart_screen.dart';
import 'package:shop_mobile/app/screens/home_detail/home_detail_binding.dart';
import 'package:shop_mobile/app/screens/home_detail/home_detail_screen.dart';

import '../screens/home/home_binding.dart';
import '../screens/home/home_screen.dart';

part 'app_routes.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.homeDetail,
      page: () => const HomeDetailScreen(),
      binding: HomeDetailBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),

  ];
}
