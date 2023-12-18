import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop_mobile/presentation/getx/login/otp/otp_binding.dart';
import 'package:shop_mobile/presentation/getx/login/otp_validate/otp_validate_binding.dart';
import 'package:shop_mobile/presentation/screen/login/otp_validate_screen.dart';
import 'package:shop_mobile/presentation/screen/login/phone_otp_screen.dart';
import '../../presentation/getx/cart/cart_binding.dart';
import '../../presentation/screen/cart/cart_screen.dart';
import '../../presentation/getx/home/home_binding.dart';
import '../../presentation/screen/home/home_screen.dart';
import '../../presentation/getx/home_detail/home_detail_binding.dart';
import '../../presentation/screen/home_detail/home_detail_screen.dart';

part 'app_routes.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
        name: Routes.validateOtp,
        page: () => const OtpValidateScreen(),
        binding: OtpValidateBinding()),
    GetPage(
        name: Routes.phoneOtp,
        page: () => const PhoneOtpScreen(),
        binding: OtpBinding()),
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
