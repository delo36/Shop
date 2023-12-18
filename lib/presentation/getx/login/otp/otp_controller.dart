import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/core/styles/dialogs/info_dialog.dart';
import 'package:shop_mobile/core/styles/dialogs/loading_dialog.dart';
import 'package:shop_mobile/core/value/constants.dart';
import 'package:shop_mobile/data/response/login/otp_response.dart';
import 'package:shop_mobile/presentation/screen/home/home_screen.dart';
import 'package:shop_mobile/presentation/screen/login/otp_validate_screen.dart';
import 'package:shop_mobile/presentation/screen/login/phone_otp_screen.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../data/network/api_service.dart';

class OtpController extends GetxController {
  static OtpController get to => Get.find();

  final ApiService _apiService = ApiService();

  Future<void> phoneOtp(String phoneNumber) async {
    Get.dialog(const LoadingDialog(title: "Authentication", content: "Loading..."));
    try {
      OtpResponse otpResponse = await _apiService.otpResponse(phoneNumber);
      if (otpResponse.status == "success") {
        Get.toNamed(Routes.validateOtp,arguments: phoneNumber);
      }
    }on SocketException catch(e){
      Get.to(const PhoneOtpScreen());
      Get.dialog(const InfoDialog(title: "Wrong Credential", content: noInternetStatusMessage));
    }on Exception catch(e){
      Get.dialog(const InfoDialog(title: "Wrong Credential", content: somethingWrongStatusMessage));
    }
  }
}
