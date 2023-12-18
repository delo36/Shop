import 'package:get/get.dart';
import 'package:shop_mobile/presentation/getx/login/otp/otp_controller.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}