import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
import 'package:shop_mobile/presentation/getx/login/otp_validate/otp_validate_controller.dart';
import 'package:shop_mobile/presentation/screen/login/phone_otp_screen.dart';
import '../../../core/styles/appbars/appbar.dart';
import '../../../core/styles/buttons/primary_button.dart';
import '../../../core/styles/textstyles/default_text.dart';
import '../../../core/styles/textstyles/textstyles.dart';

class OtpValidateScreen extends StatefulWidget {
  const OtpValidateScreen({super.key});
  @override
  State<OtpValidateScreen> createState() => _OtpValidateScreenState();
}

class _OtpValidateScreenState extends State<OtpValidateScreen> {
  int timerSeconds = 30;
  late Timer timer;
  late TextEditingController otpController;

  @override
  void initState() {
    _startTimer();
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<OtpValidateController>(builder: (controller){
      return Scaffold(
        appBar: defaultAppBar(context, title: ""),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Column(
                children: [
              Column(
              children: [
              DefaultText("Verification",
                  style: TextStyles.headerTextStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 40)),
                const DefaultText("Your Verification code was sent to number",
                    style: TextStyles.headerTextStyle),
                DefaultText(controller.phoneNumber,
                style: TextStyles.headerTextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
            ],
          ),
                  (height * 0.09).paddingHeight,
                  Pinput(
                    controller: otpController,
                    length: 6,
                    closeKeyboardWhenCompleted: true,
                  ),
                  (height * 0.02).paddingHeight,
                  _timerWidget,
                  (height * 0.02).paddingHeight,
                  PrimaryButton(
                      onPressed: () async{
                        if(otpController.text.isNotEmpty){
                          await controller.otpValidate(controller.phoneNumber, otpController.text);
                        }
                      },
                      label: "Next")
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget get _timerWidget {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
            padding:timerSeconds >0 ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10) : const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:timerSeconds >0 ? Colors.grey[300] : Colors.red
            ),
            child: timerSeconds >0 ? DefaultText(
              "$timerSeconds s",
              style: TextStyles.subTitleTextStyle,
            ) : InkWell(
              onTap: (){
                Get.to(const PhoneOtpScreen());
              },
              child: DefaultText(
                "Resend",style: TextStyles.subTitleTextStyle.copyWith(color: Colors.white),
              ),
            )
        )
    );
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }
}