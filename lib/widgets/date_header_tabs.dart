import 'package:dashboard/widgets/header_tabs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHeaderTabs extends StatelessWidget {
  final List<String> tabs;
  final DateTime? selectedDate;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime?) onDateSelected;
  final String Function(DateTime?)? formatDate;

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

  String _defaultFormat(DateTime? date) {
    if (date == null) return 'Select Date';
    return DateFormat('d MMMM yyyy').format(date);
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    onDateSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderTabs(
      tabs: tabs,
      buttonLabel:
          formatDate?.call(selectedDate) ?? _defaultFormat(selectedDate),
      buttonIcon: Icons.calendar_today_outlined,
      onButtonPressed: () => _pickDate(context),
    );
  }
}
