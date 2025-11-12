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
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StatusCardItem(
          value: data.value,
          title: data.title,
          iconData: data.icon,
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
  });

  final String value;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(iconData, size: 32),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
