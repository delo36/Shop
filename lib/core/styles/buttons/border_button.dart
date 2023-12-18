import 'package:flutter/material.dart';

import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';


class BorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  const BorderButton({Key? key,required this.onPressed,required this.label,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.black,
            side: BorderSide.none,
              // the thickness
              // the color of the bord
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )
        ),
        onPressed: onPressed, child: DefaultText(label,style: TextStyles.buttonTextStyle.copyWith(color: Colors.white),));
  }
}