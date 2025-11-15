import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

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
          )
        : PrimaryElevatedIconBtn(
            onPressed: _pickDate,
            icon: Icons.calendar_today_outlined,
            btnLabel: selectedDate.toReadableDate(),
          );
  }
}
