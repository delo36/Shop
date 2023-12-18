
import 'package:flutter/material.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
import '../styles/textstyles/default_text.dart';
import '../styles/textstyles/textstyles.dart';
import '../value/images.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageIcon(AssetImage(Images.noDataIcon),size: 30,),
          5.paddingHeight,
          const DefaultText("No Data", style: TextStyles.bodyTextStyle)
        ],
      ),
    );
  }
}
