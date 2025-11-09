import 'package:dashboard/utils/constants.dart';
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
  HomeScreenCards(
    value: '120',
    title: Constants.todaysOrders,
    icon: Icons.folder,
  ),
  HomeScreenCards(
    value: '120',
    title: Constants.todaysIncome,
    icon: Icons.folder,
  ),
  HomeScreenCards(
    value: '240',
    title: Constants.todaysCustomers,
    icon: Icons.folder,
  ),
  HomeScreenCards(
    value: '140',
    title: Constants.cancelledOrders,
    icon: Icons.folder,
  ),
];
