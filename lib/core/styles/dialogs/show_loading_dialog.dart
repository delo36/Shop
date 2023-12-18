import 'package:flutter/material.dart';
import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';
import 'loading_dialog.dart';

class ShowLoadingDialog extends StatelessWidget {
  final String title;
  final String content;
  const ShowLoadingDialog({super.key,required this.title,required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DefaultText(title,style: TextStyles.titleTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w500)),
      content:  Row(
        children: [
          const CircularProgressIndicator(color: Colors.blue,),
          const SizedBox(width: 20,),
          DefaultText(content, style: TextStyles.bodyTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

void showLoadingDialog({required BuildContext context,required String title,required String content}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      child: LoadingDialog(title: title, content: content),
      onWillPop: () async {
        return false;
      },
    ),
  );
}
