import 'package:flutter/material.dart';

class TextStyles{
  //app bar
  static const appBarTextStyle=TextStyle(fontSize: 20);
  //Button
  static const buttonTextStyle=TextStyle(fontSize: 16);

  //TextFields
  //set text scale factor 1 for big text size device
  static TextStyle textFieldsTextStyle(BuildContext context) => TextStyle(fontSize: 13/ MediaQuery.of(context).textScaleFactor);
  //dropDownButtons
  static const dropDownButtonTextStyle=TextStyle(fontSize: 16);
  //Text
  static const headerTextStyle=TextStyle(fontSize: 20);
  static const titleTextStyle=TextStyle(fontSize: 18);
  static const subTitleTextStyle=TextStyle(fontSize: 16);
  static const bodyTextStyle=TextStyle(fontSize: 14);
  static const descriptionTextStyle=TextStyle(fontSize: 13);
  static const footerTextStyle=TextStyle(fontSize: 11);
  static const smallTextStyle=TextStyle(fontSize: 10);
}