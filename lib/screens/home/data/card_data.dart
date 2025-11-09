import 'package:flutter/material.dart';

class HomeScreenCards {
  final String value;
  final String title;
  final IconData icon;

  HomeScreenCards({
    required this.value,
    required this.title,
    required this.icon,
  });
}

final List<HomeScreenCards> homeScreenCards = <HomeScreenCards>[
  HomeScreenCards(value: '120', title: 'Today\'s Orders', icon: Icons.folder),
  HomeScreenCards(value: '120', title: 'Today\'s Income', icon: Icons.folder),
  HomeScreenCards(
    value: '240',
    title: 'Today\'s Customers',
    icon: Icons.folder,
  ),
  HomeScreenCards(value: '140', title: 'Cancelled Orders', icon: Icons.folder),
];
