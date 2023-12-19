import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shop_mobile/presentation/getx/register/register_controller.dart';

import '../../../../core/styles/textstyles/default_text.dart';
import '../../../../core/styles/textstyles/textstyles.dart';
class RegisterPhoneNumberWidget extends StatelessWidget {
  const RegisterPhoneNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller){
      return Container(
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                width: 1,
                color: Colors.amber
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            autofocus: true,
            enabled: false,
            style: TextStyles.subTitleTextStyle.copyWith(color: Colors.black,fontSize: 19),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: controller.phNumberController,
            decoration: InputDecoration(
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DefaultText('09',style: TextStyles.subTitleTextStyle.copyWith(fontSize: 19,color: Colors.black)),
              ),
              border: InputBorder.none,
              hintText: "",
              hintStyle: TextStyles.subTitleTextStyle.copyWith(color: Colors.grey,fontSize: 19),
            ),
          ),
        ),
      );
    });
  }
}
