import 'dart:io';
import 'package:get/get.dart';
import 'package:shop_mobile/data/response/login/validate_otp_response.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/styles/dialogs/info_dialog.dart';
import '../../../../core/styles/dialogs/loading_dialog.dart';
import '../../../../core/value/constants.dart';
import '../../../../data/network/api_service.dart';
import '../../../screen/home/home_screen.dart';

class OtpValidateController extends GetxController{
  static OtpValidateController get to => Get.find();
  String phoneNumber = Get.arguments;
  final ApiService _apiService = ApiService();


  Future<void> otpValidate(String phoneNumber,String otpCode) async{
    Get.dialog(const LoadingDialog(title: "Authentication", content: "Loading..."));
    try {
      ValidateOtpResponse validateOtpResponse = await _apiService.validateOtpResponse(phoneNumber, otpCode);
      if (validateOtpResponse.data?.registerVerifyToken != "Null") {
        Get.toNamed(Routes.register, arguments: {
          'phNumber': phoneNumber,
          'token': validateOtpResponse.data?.registerVerifyToken,

        } );


      }else{
        Get.toNamed(Routes.home);

      }
    }on SocketException catch(e){
      Get.dialog(const InfoDialog(title: "Wrong Credential", content: noInternetStatusMessage));
    }on Exception catch(e){
      Get.dialog(const InfoDialog(title: "Wrong Credential", content: somethingWrongStatusMessage));
    }
  }
  }