import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model.dart';
import '../../../data/models/division_model.dart';
import '../../../data/models/product_category_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/variant_model.dart';
import '../../../data/network/api_service.dart';


class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final ApiService _apiService = ApiService();

  final divisionList = <DivisionModel>[].obs;
  final productCategoryList = <ProductCategoryModel>[].obs;
  final categoryList = <CategoryModel>[].obs;
  final productList = <ProductModel>[].obs;


  int categoryLength = 0;
  int selectedDivisionIndex = 0;
  int selectedDivisionId = 0;
  int selectedCategoryId = 0;
  int selectedProductCategoryId = 0;
  int currentIndex = 0;
  int variantTotalPrice =0;

  final List<String> indexList = [
    '0',
    '1',
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDivisionData(_apiService.getDivisions());
  }
  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  void setSelectedDivisionIndex(int index) {
    selectedDivisionIndex = index;
    update();
  }

  void setSelectedDivisionId(int id) {
    selectedDivisionId = id;

    fetchCategoryList(selectedDivisionId);
    update();
  }

  void setSelectedCategoryId(int index) {
    selectedCategoryId = index;
    fetchCategoryList(selectedDivisionId);

    update();
  }

  void setSelectedProductCategoryId(int index) {
    selectedProductCategoryId = index;
    fetchProductList(1, 20, selectedDivisionId, selectedCategoryId,
        selectedProductCategoryId);
    update();
  }

  Future<void> fetchDivisionData(
      Future<List<DivisionModel>> divisionModelList) async {
    try {
      final division = await divisionModelList;

      divisionList.assignAll(division);

      if (selectedDivisionId == 0) {
        fetchCategoryList(divisionList[0].divisionId);
      } else {
        fetchCategoryList(selectedDivisionId);
      }

    } catch (e) {
      print(e);
    }
  }

  void fetchCategoryList(int divisionId) async {
    categoryList.assignAll(await _apiService.getCategory(divisionId));

    if (selectedCategoryId == 0) {
      fetchProductCategoryList(categoryList[0].itemCategoryId, divisionId);
    } else {
      fetchProductCategoryList(selectedCategoryId, divisionId);
    }
    update();
  }

  void fetchProductCategoryList(int categoryId, int divisionId) async {
    productCategoryList
        .assignAll(await _apiService.getProductCategory(categoryId));

    if (selectedProductCategoryId == 0) {
      fetchProductList(1, 20, divisionId, categoryId,
          productCategoryList[0].productCategoryId);
    }
    fetchProductList(1, 20, divisionId, categoryId, selectedProductCategoryId);
    update();
  }

  void fetchProductList(int page, int limit, int divisionId, int itemCategoryId,
      int productCategoryId) async {
    productList.assignAll(await _apiService.getProduct(
        page, limit, divisionId, itemCategoryId, productCategoryId));
    update();
  }

  void incrementCount(VariantModel variantModel,int price) {
    variantModel.count ??= 0;

    variantModel.count = variantModel.count! + 1;
    variantTotalPrice += price;
    update();
  }

  void decrementCount(VariantModel variantModel,int price) {
    variantModel.count ??= 0;

    if(variantModel.count != 0){
      variantModel.count = variantModel.count! - 1;
      variantTotalPrice -= price;

    }
    update();

  }


  Future<void> postCartItem(String productCode, String remark,String variantId) async {
    try {
      _apiService.addToCart(productCode, 1, remark);
      update();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }

}
