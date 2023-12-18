import 'package:flutter/material.dart';

class TextFieldsUtils{
  static bool isTextFieldsEmpty(List<TextEditingController> textFields){
    for(TextEditingController textField in textFields){
      if(textField.text.isEmpty){
        return true;
      }
    }
    return false;
  }
}