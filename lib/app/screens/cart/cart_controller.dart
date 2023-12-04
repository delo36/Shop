import 'package:get/get.dart';
import 'package:shop_mobile/app/models/cart_model.dart';

import '../../network/api_service.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  RxBool isLoading = true.obs;
  final ApiService _apiService = ApiService();
  final cartList = <CartModel>[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
    fetchCartData();
  }

  void fetchCartData() async {
    cartList.assignAll(await _apiService.getCart());
    print(cartList.length);
    update();
  }

  void fetchData() async {
    isLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    isLoading(false);
  }

  Future<void> deleteCartItem(int cartItemId) async {
    try {
      await _apiService.deleteCartItem(cartItemId);

      fetchCartData();
      update();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }

  Future<void> deleteAllCartItem() async {
    try {
      await _apiService.deleteAllCartItem();

      fetchCartData();
      update();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }
}
