part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const phoneOtp = _Paths.phoneOtp;
  static const validateOtp = _Paths.validateOtp;
  static const home = _Paths.home;
  static const homeDetail = _Paths.homeDetail;
  static const cart = _Paths.cart;

}

abstract class _Paths {
  static const validateOtp = '/validateOtp';
  static const phoneOtp = '/phoneOtp';
  static const home = '/home';
  static const homeDetail = '/homeDetail';
  static const cart = '/cart';

}
