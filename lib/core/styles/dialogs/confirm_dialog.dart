import 'package:flutter/material.dart';

import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';

class ConfirmDialog extends StatelessWidget {
  final String title,content;
  final VoidCallback onPressedConfirm;
  const ConfirmDialog({Key? key,required this.title,required this.content,required this.onPressedConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DefaultText(title, style: TextStyles.titleTextStyle,),
      content: DefaultText(content, style: TextStyles.bodyTextStyle,),
      actions: [
        TextButton(onPressed: ()=> Navigator.of(context).pop(),
            child: DefaultText("No",style: TextStyles.buttonTextStyle.copyWith(color: Colors.black),)
        ),
        TextButton(onPressed: ()=> onPressedConfirm(),
            child:  DefaultText("Yes",style: TextStyles.buttonTextStyle.copyWith(color: Colors.black),)
        )
      ],
    );
  }
}

void showConfirmDialog({required BuildContext context,required  String title, required String content,required VoidCallback onPressedConfirm}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => ConfirmDialog(title: title, content: content, onPressedConfirm: onPressedConfirm),
  );
}
