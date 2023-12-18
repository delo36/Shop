
import 'package:flutter/material.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';

import '../../../core/styles/textstyles/default_text.dart';
import '../../../core/styles/textstyles/textstyles.dart';
import '../styles/buttons/primary_button.dart';

class ErrorRetryWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback retry;
  const ErrorRetryWidget({super.key,required this.errorMessage,required this.retry});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultText(errorMessage, style: TextStyles.bodyTextStyle.copyWith(color: Colors.red)),
        5.paddingHeight,
        DefaultButton(onPressed: retry, label: "Retry")
      ],
    ));
  }
}
