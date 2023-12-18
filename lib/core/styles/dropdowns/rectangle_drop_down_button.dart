import 'package:flutter/material.dart';

import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';

class RectangleDropDownButton extends StatefulWidget {
  final List<String> values;
  final String selectedValue;
  final String label;
  final Function(String? value) onChange;
  const RectangleDropDownButton({Key? key,required this.values,required this.selectedValue,required this.label,required this.onChange}) : super(key: key);

  @override
  State<RectangleDropDownButton> createState() => _RectangleDropDownButtonState();
}

class _RectangleDropDownButtonState extends State<RectangleDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        value: (widget.selectedValue=="")? null:widget.selectedValue,
        hint: DefaultText(widget.label,style: TextStyles.bodyTextStyle.copyWith(color: Colors.grey),),
        items:  widget.values.map((label) => DropdownMenuItem<String>(value: label, child: DefaultText(label,style: TextStyles.bodyTextStyle,),)).toList(),
        onChanged: widget.onChange,
      ),
    );
  }
}