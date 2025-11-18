import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/header_tabs.dart';
import 'package:flutter/material.dart';

class DateHeaderTabs extends StatelessWidget {
  const DateHeaderTabs({
    super.key,
    required this.tabs,
    required this.selectedDate,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    this.formatDate,
  });

  final List<String> tabs;
  final DateTime? selectedDate;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime?) onDateSelected;
  final String Function(DateTime?)? formatDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
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
    onDateSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderTabs(
      tabs: tabs,
      buttonLabel:
          formatDate?.call(selectedDate) ?? selectedDate.toReadableDate(),
      buttonIcon: Icons.calendar_today_outlined,
      onButtonPressed: () => _pickDate(context),
    );
  }
}
