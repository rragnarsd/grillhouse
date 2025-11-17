import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const Text('Income Desktop')
        : Responsive.isTablet(context)
        ? const Text('Income Tablet')
        : const Text('Income Mobile');
  }
}
