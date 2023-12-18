import 'package:get/get.dart';

import '../../../data/models/product_detail_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/network/api_service.dart';

class HomeDetailController extends GetxController {
  static HomeDetailController get to => Get.find();
  late ProductModel productModel = Get.arguments;
  RxBool isLoading = true.obs;
  final productList = <ProductModel>[];

  final Rx<Data> selectedProduct = Data(
          productCode: "",
          erpCode: "",
          productName: "",
          divisionId: 0,
          divisionName: "",
          itemCategoryId: 0,
          itemCategoryName: "",
          productCategoryId: 0,
          productCategoryName: "",
          price: 0,
          imageUrl: "")
      .obs;
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchData();
    fetchProductDetail(productModel.productCode);
    fetchRelatedProduct(productModel.productCode);
  }

  void fetchData() async {
    isLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    isLoading(false);
  }

  void fetchProductDetail(String productCode) async {
    selectedProduct.value = (await _apiService.getProductDetail(productCode));
  }

  void fetchRelatedProduct(String productCode) async {
    productList
        .assignAll(await _apiService.getRelatedProduct(1, 20, productCode));
    update();
  }

  Future<void> postCartItem(String productCode, String remark) async {
    try {
      _apiService.addToCart(productCode, 1, remark);
      update();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }
}
