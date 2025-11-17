import 'package:flutter/material.dart';

class StatusRow extends StatelessWidget {
  const StatusRow({super.key, required this.statusCard});

  final List<dynamic> statusCard;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(statusCard.length, (int index) {
        final dynamic statusCardData = statusCard[index];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < statusCard.length - 1 ? 16.0 : 0,
            ),
            child: StatusCard(data: statusCardData),
          ),
        );
      }),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, this.isMobile = false, required this.data});

  final bool isMobile;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: data.color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StatusCardItem(
          value: data.value,
          title: data.title,
          iconData: data.icon,
          color: data.color,
        ),
      ),
    );
  }
}

class StatusCardItem extends StatelessWidget {
  const StatusCardItem({
    super.key,
    required this.value,
    required this.title,
    required this.iconData,
    required this.color,
  });

  final String value;
  final String title;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(iconData, size: 32),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(value, style: theme.textTheme.headlineSmall),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
