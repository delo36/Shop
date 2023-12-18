import 'package:flutter/material.dart';

import '../../value/sizes.dart';
import '../textstyles/textstyles.dart';


class OutLinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType textInputType;
  final bool? isValidation;
  final int? minLine;
  final int? maxLine;

  const OutLinedTextField({Key? key, required this.controller, required this.label,required this.textInputType,this.isValidation,this.minLine,this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: formFieldsPaddingTopSize),
      child: TextFormField(
        validator: (value) {
          if(isValidation!=null && isValidation==true){
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
          }
          return null;
        },
        style: TextStyles.textFieldsTextStyle(context),
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: textInputType,
        minLines: minLine,
        maxLines: maxLine,
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ), hintText: label,hintStyle: TextStyles.bodyTextStyle.copyWith(color: Colors.grey)),),
    );
  }
}