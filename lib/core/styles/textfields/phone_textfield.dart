import 'package:flutter/material.dart';
import 'package:shop_mobile/core/styles/styles.dart';
import '../textstyles/textstyles.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? enable;

  const PhoneTextField({Key? key, required this.controller, required this.label, this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          enabled: enable,
          style: TextStyles.subTitleTextStyle.copyWith(color: Colors.black,fontSize: 19),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            prefix: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DefaultText('09',style: TextStyles.subTitleTextStyle.copyWith(fontSize: 25,color: Colors.black)),
            ),
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyles.subTitleTextStyle.copyWith(color: Colors.grey,fontSize: 19),
          ),
        ),
      ),
    );
  }
}
