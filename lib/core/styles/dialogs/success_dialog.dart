import 'package:flutter/material.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
import '../buttons/primary_button.dart';
import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';

class ConfirmDialog extends StatelessWidget {
  final String content;
  final VoidCallback onPressed;

  const ConfirmDialog({Key? key, required this.content, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              width: double.infinity,
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                "assets/images/icon_success.png",
                width: 80,
                height: 80,
                color: Colors.white,
              ),
            ),
            10.paddingHeight,
            Container(
                margin: const EdgeInsets.all(8),
                child: DefaultText(
                  content,
                  style: TextStyles.bodyTextStyle,
                )),
            10.paddingHeight,
            DefaultButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed();
                },
                label: "OK"),
          ],
        ));
  }
}

void showSuccessDialog({required BuildContext context, required String content, required VoidCallback onPressed}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => ConfirmDialog(content: content, onPressed: onPressed),
  );
}
