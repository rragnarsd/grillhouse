import 'package:dashboard/screens/home/data/card_data.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, this.isMobile = false, required this.data});

  final bool isMobile;
  final HomeScreenCards data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: HomeCardItem(
          value: data.value,
          title: data.title,
          iconData: data.icon,
        ),
      ),
    );
  }
}

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(iconData, size: 32),
        ),
      ],
    );
  }
}
