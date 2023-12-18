import 'package:http/http.dart' as http;
import 'package:shop_mobile/data/request/register_customer_request.dart';
import 'dart:convert';
import '../../core/util/constants.dart';
import '../models/cart_model.dart';
import '../models/category_model.dart';
import '../models/division_model.dart';
import '../models/product_category_model.dart';
import '../models/product_detail_model.dart';
import '../models/product_model.dart';
import '../response/login/otp_response.dart';
import '../response/login/register_customer_response.dart';
import '../response/login/validate_otp_response.dart';

class ApiService {
  static const String _divisionUrl = "${Constants.baseUrl}product-divisions";

  Future<List<DivisionModel>> getDivisions() async {
    final response = await http.get(Uri.parse(_divisionUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['data'] as List;
      return decodeData
          .map((division) => DivisionModel.fromJson(division))
          .toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<List<CategoryModel>> getCategory(int categoryId) async {
    String categoryUrl =
        "${Constants.baseUrl}product-divisions/item-categories?divisionId=$categoryId";
    final response = await http.get(Uri.parse(categoryUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['data'] as List;
      return decodeData
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } else {
      ("Fail");
      throw Exception("Something wrong");
    }
  }

  Future<List<ProductCategoryModel>> getProductCategory(int categoryId) async {
    String productCategoryUrl =
        "${Constants.baseUrl}product-divisions/product-groups?itemCategoryId=$categoryId";

    final response = await http.get(Uri.parse(productCategoryUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['data'] as List;
      return decodedData
          .map((productCategory) =>
              ProductCategoryModel.fromJson(productCategory))
          .toList();
    } else {
      print("Fail");
      throw Exception("Something went wrong");
    }
  }

  Future<List<ProductModel>> getProduct(int page, int limit, int divisionId,
      int itemCategoryId, int productCategoryId) async {
    String productUrl =
        "${Constants.baseUrl}products?page=$page&limit=$limit&divisionId=$divisionId&itemCategoryId=$itemCategoryId&productCategoryId=$productCategoryId";

    final response = await http.get(Uri.parse(productUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['data']['data'] as List;
      return decodedData
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      print("Fail");
      throw Exception("Something went wrong");
    }
  }

  Future<Data> getProductDetail(String productCode) async {
    String productDetailUrl = "${Constants.baseUrl}products/$productCode";

    final response = await http.get(Uri.parse(productDetailUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['data'];

      return Data.fromJson(decodedData);
    } else {
      print("Fail");
      throw Exception("Something went wrong");
    }
  }

  Future<List<ProductModel>> getRelatedProduct(
      int page, int limit, String productCode) async {
    String productUrl =
        "${Constants.baseUrl}products/related-product/$productCode?page=$page&limit=$limit";

    final response = await http.get(Uri.parse(productUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['data']['data'] as List;
      return decodedData
          .map((relateProduct) => ProductModel.fromJson(relateProduct))
          .toList();
    } else {
      print("Fail");
      throw Exception("Something went wrong");
    }
  }

  Future<List<CartModel>> getCart() async {
    String productUrl = "${Constants.baseUrl}carts";
    final Map<String, String> headers = {
      'x-temp-user-id': '324432432', // Adjust based on your API requirements
    };

    final response = await http.get(Uri.parse(productUrl), headers: headers);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['data'] as List;
      return decodedData.map((cart) => CartModel.fromJson(cart)).toList();
    } else {
      print("Fail");
      throw Exception("Something went wrong");
    }
  }

  Future<void> deleteCartItem(int cartItemId) async {
    String deleteCartUrl = "${Constants.baseUrl}carts/$cartItemId";
    final Map<String, String> headers = {
      'x-temp-user-id': '324432432',
    };

    final response =
        await http.delete(Uri.parse(deleteCartUrl), headers: headers);

    if (response.statusCode == 200) {
      print("Item deleted successfully");
    } else {
      // Handle errors
      print("Failed to delete item");
      throw Exception("Something went wrong");
    }
  }

  Future<void> deleteAllCartItem() async {
    String deleteCartUrl = "${Constants.baseUrl}carts";
    final Map<String, String> headers = {
      'x-temp-user-id': '324432432',
    };

    final response =
        await http.delete(Uri.parse(deleteCartUrl), headers: headers);

    if (response.statusCode == 200) {
      print("Item deleted successfully");
    } else {
      // Handle errors
      print("Failed to delete item");
      throw Exception("Something went wrong");
    }
  }

  Future<void> addToCart(
      String productCode, int quantity, String remark) async {
    String addToCartUrl = "${Constants.baseUrl}carts";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-temp-user-id': '324432432',
      'token':''
    };

    final Map<String, dynamic> requestBody = {
      "productCode": productCode,
      "variantId": null,
      "quantity": 1,
      "remark": remark,
    };

    final response = await http.post(
      Uri.parse(addToCartUrl),
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData =
          jsonDecode(response.body)['data'];
    } else {
      // Handle errors
      throw Exception("Something went wrong");
    }
  }

  Future<OtpResponse> otpResponse(String phoneNumber) async {
    String otpUrl = "${Constants.baseUrl}auth/request-otp";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-temp-user-id': '324432432',
    };

    final Map<String, dynamic> requestBody = {
      'phoneNumber': phoneNumber,
    };

    try {
      final response = await http.post(Uri.parse(otpUrl),
          headers: headers, body: json.encode(requestBody));
      if (response.statusCode == 201) {
        final decodedData = json.decode(response.body);
        return OtpResponse.fromJson(decodedData);
      } else {
        throw Exception("Failed to request Otp");
      }
    } catch (error) {
      throw Exception("An error occurred during the OTP request");
    }
  }


  Future<ValidateOtpResponse> validateOtpResponse(String phoneNumber,String otpCode) async{
    String otpValidateUrl = "${Constants.baseUrl}auth/validate-otp";
    final Map<String,String> headers = {
      'Content-Type': 'application/json',
      'x-temp-user-id': '324432432',
    };

    final Map<String, dynamic> requestBody = {
      'phoneNumber': phoneNumber,
      'otpCode' : otpCode,
    };

    try {
      final response = await http.post(Uri.parse(otpValidateUrl),
          headers: headers, body: json.encode(requestBody));
      if (response.statusCode == 201) {
        final decodedData = json.decode(response.body);
        return ValidateOtpResponse.fromJson(decodedData);
      } else {
        throw Exception("Failed Validate Otp");
      }
    } catch (error) {
      throw Exception("An error occurred during the OTP validate");
    }
  }
}
