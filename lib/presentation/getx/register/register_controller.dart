import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/data/models/register_customer_model.dart';
import 'package:shop_mobile/data/request/register_customer_request.dart';

import '../../../data/models/register_customer_response_model.dart';
import '../../../data/network/api_service.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  Map<String, dynamic> params = Get.arguments;

  late String phNumber,token ;

  TextEditingController phNumberController = TextEditingController();

  final ApiService _apiService = ApiService();



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    phNumberController.text = params['phNumber'];
     token = params['token'];

  }

  Future<void> registerCustomer(
      RegisterCustomerModel registerCustomerModel
      ) async {
    try {

      _apiService.registerCustomer(
          registerCustomerModel);
    } catch (e) {
      print("Error deleting item: $e");
    }
  }


}