import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({
    super.key,
    required this.primaryBtnLabel,
    required this.secondaryBtnLabel,
    required this.onPrimaryBtnPressed,
    required this.primaryBtnColor,
    required this.secondaryBtnColor,
    required this.primaryBtnTextColor,
    required this.secondaryBtnTextColor,
  });

  final String primaryBtnLabel;
  final String secondaryBtnLabel;
  final VoidCallback onPrimaryBtnPressed;
  final Color primaryBtnColor;
  final Color secondaryBtnColor;
  final Color primaryBtnTextColor;
  final Color secondaryBtnTextColor;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: PrimaryBtn(
                  onClick: () => Navigator.of(context).pop(),
                  label: secondaryBtnLabel,
                  bgColor: secondaryBtnColor,
                  textColor: secondaryBtnTextColor,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: PrimaryBtn(
                  onClick: onPrimaryBtnPressed,
                  label: primaryBtnLabel,
                  bgColor: primaryBtnColor,
                  textColor: primaryBtnTextColor,
                ),
              ),
            ],
          )
        : Row(
            children: <Widget>[
              Expanded(
                child: PrimaryBtn(
                  onClick: () => Navigator.of(context).pop(),
                  label: secondaryBtnLabel,
                  bgColor: secondaryBtnColor,
                  textColor: secondaryBtnTextColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryBtn(
                  onClick: onPrimaryBtnPressed,
                  label: primaryBtnLabel,
                  bgColor: primaryBtnColor,
                  textColor: primaryBtnTextColor,
                ),
              ),
            ],
          );
  }
}
