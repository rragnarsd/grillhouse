import 'package:dashboard/widgets/header.dart';
import 'package:dashboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          const Expanded(child: SideBar()),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[const AppHeader(), widget ?? const SizedBox()],
            ),
          ),
        ],
      ),
    );
  }
}
