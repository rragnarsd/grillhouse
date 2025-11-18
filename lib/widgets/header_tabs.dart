import 'dart:ui';

import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class HeaderTabs extends StatefulWidget {
  const HeaderTabs({
    super.key,
    required this.tabs,
    required this.onButtonPressed,
    this.buttonLabel = '',
    this.buttonIcon = Icons.calendar_today_outlined,
  });

  final List<String> tabs;
  final VoidCallback onButtonPressed;
  final String buttonLabel;
  final IconData buttonIcon;

  @override
  State<HeaderTabs> createState() => _HeaderTabsState();
}

class _HeaderTabsState extends State<HeaderTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: isMobile
                ? ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      scrollbars: true,
                      dragDevices: <PointerDeviceKind>{
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: _buildTabs(theme)),
                    ),
                  )
                : Row(children: _buildTabs(theme)),
          ),
          const SizedBox(width: 16),
          isMobile
              ? PrimaryFilledIconButton(
                  onPressed: widget.onButtonPressed,
                  icon: Icons.calendar_today_outlined,
                  backgroundColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                )
              : PrimaryElevatedIconBtn(
                  onPressed: widget.onButtonPressed,
                  icon: widget.buttonIcon,
                  btnLabel: widget.buttonLabel,
                  backgroundColor: Colors.grey.shade100,
                  textColor: Colors.black,
                ),
        ],
      ),
    );
  }

  List<Widget> _buildTabs(ThemeData theme) {
    return List<Widget>.generate(
      widget.tabs.length,
      (int index) => GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.tabs[index],
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: selectedIndex == index
                      ? AppColors.secondary
                      : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              AnimatedUnderline(
                isActive: selectedIndex == index,
                label: widget.tabs[index],
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedUnderline extends StatelessWidget {
  final bool isActive;
  final String label;
  final TextStyle? style;

  const AnimatedUnderline({
    super.key,
    required this.isActive,
    required this.label,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: label, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final double textWidth = textPainter.size.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 2,
      width: isActive ? textWidth : 0,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
