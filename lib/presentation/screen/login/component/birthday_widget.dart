import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/styles/textstyles/default_text.dart';
import '../../../../core/styles/textstyles/textstyles.dart';

class BirthdayWidget extends StatefulWidget {
  final String birthdayDate;
  final Function(String) onDateSelected;

  const BirthdayWidget({
    Key? key,
    required this.birthdayDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<BirthdayWidget> createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  DateTime? birthDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultText(
                widget.birthdayDate,
                style: TextStyles.bodyTextStyle,
              ),
              const Icon(Icons.date_range, size: 30)
            ],
          ),
        ),
      ),
      onTap: () async {
        final datePick = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (datePick != null && datePick != birthDate) {
          setState(() {
            birthDate = datePick;
            String formattedDate =
            DateFormat("yyyy-MM-dd").format(birthDate!); // Format as ISO 8601
            widget.onDateSelected(formattedDate);
          });
        }
      },
    );
  }
}
