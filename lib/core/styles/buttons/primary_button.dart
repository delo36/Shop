
import 'package:flutter/material.dart';
import '../../value/sizes.dart';
import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const PrimaryButton({Key? key,required this.onPressed,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: formFieldsPaddingTopSize),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3)
            ),
            minimumSize: const Size.fromHeight(buttonHeight), // fromHeight use double.infinity as width and 40 is the height
          ),
          onPressed: onPressed, child: DefaultText(label,style: TextStyles.buttonTextStyle.copyWith(color: Colors.white),)),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const LoginButton({Key? key,required this.onPressed,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )
        ),
        onPressed: onPressed, child: DefaultText(label,style: TextStyles.buttonTextStyle.copyWith(color: Colors.white),),);
  }
}

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const DefaultButton({Key? key,required this.onPressed,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, child: DefaultText(label,style: TextStyles.buttonTextStyle),);
  }
}



