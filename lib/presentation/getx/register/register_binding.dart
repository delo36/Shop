import 'package:get/get.dart';
import 'package:shop_mobile/presentation/getx/register/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}