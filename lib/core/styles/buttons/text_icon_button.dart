import 'package:flutter/material.dart';
import '../../value/sizes.dart';
import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';

class TextIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPress;
  const TextIconButton({Key? key,required this.icon,required this.label,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Row(
          children:  [
            Icon(icon, color: Colors.black,),
            const SizedBox(width: smallPadding,),
            DefaultText(label, style: TextStyles.bodyTextStyle.copyWith(color: Colors.black,),
            ),
          ],
        )
    );
  }
}
