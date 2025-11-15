import 'package:dashboard/utils/responsive.dart';
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: <Widget>[
          Row(
            children: List<Widget>.generate(
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
                              ? Colors.black
                              : Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                              final TextPainter textPainter = TextPainter(
                                text: TextSpan(
                                  text: widget.tabs[index],
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                maxLines: 1,
                                textDirection: TextDirection.ltr,
                              );
                              textPainter.layout();
                              final double textWidth = textPainter.size.width;

                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: 2,
                                width: selectedIndex == index ? textWidth : 0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              );
                            },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Responsive.isMobile(context)
              ? PrimaryFilledIconButton(
                  onPressed: widget.onButtonPressed,
                  icon: Icons.calendar_today_outlined,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                )
              : PrimaryElevatedIconBtn(
                  onPressed: widget.onButtonPressed,
                  icon: widget.buttonIcon,
                  btnLabel: widget.buttonLabel,
                ),
        ],
      ),
    );
  }
}
