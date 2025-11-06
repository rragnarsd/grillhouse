import 'package:flutter/material.dart';

class SidebarItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SidebarItem({required this.title, required this.icon, required this.onTap});
}

final List<SidebarItem> sidebarItems = <SidebarItem>[
  SidebarItem(title: 'Home', icon: Icons.home, onTap: () {}),
  SidebarItem(title: 'Settings', icon: Icons.settings, onTap: () {}),
  SidebarItem(title: 'Profile', icon: Icons.person, onTap: () {}),
];
