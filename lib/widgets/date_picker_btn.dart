import 'package:flutter/material.dart';
import 'package:grill_house/utils/extensions.dart';
import 'package:grill_house/utils/responsive.dart';
import 'package:grill_house/utils/theme/app_colors.dart';
import 'package:grill_house/widgets/buttons.dart';

class DatePickerButton extends StatefulWidget {
  final DateTime? initialDate;

  const DatePickerButton({super.key, this.initialDate});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
      builder: (BuildContext context, Widget? child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.secondary),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? PrimaryFilledIconButton(
            onPressed: _pickDate,
            icon: Icons.calendar_today_outlined,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            backgroundColor: Colors.grey.shade100,
          )
        : PrimaryElevatedIconBtn(
            onPressed: _pickDate,
            backgroundColor: Colors.grey.shade100,
            icon: Icons.calendar_today_outlined,
            btnLabel: selectedDate.toReadableDate(),
            textColor: Colors.black,
          );
  }
}
