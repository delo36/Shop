import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
import 'package:shop_mobile/core/styles/styles.dart';
import '../../../core/styles/buttons/primary_button.dart';
import '../../../core/styles/textfields/phone_textfield.dart';
import '../../../core/value/images.dart';
import '../../getx/login/otp/otp_controller.dart';

class PhoneOtpScreen extends StatefulWidget {
  const PhoneOtpScreen({super.key});

  @override
  State<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<OtpController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear, size: 30),
                ),
              ),

              30.paddingHeight,

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    Images.shwemall_logo,
                    height: height * 0.1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              (0.06 * height).paddingHeight,
              PhoneTextField(controller: phoneController, label: "Phone Number"),
              30.paddingHeight,

              PrimaryButton(
                onPressed: () async {
                  if (phoneController.text.isNotEmpty) {
                    await controller.phoneOtp(phoneController.text);
                  }
                },
                label: "Next",
              ),
            ],
          ),
        ),
      );
    });
  }
}
