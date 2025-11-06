import 'package:dashboard/widgets/header.dart';
import 'package:dashboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.widget});

  final Widget? widget;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppHeader(scaffoldKey: scaffoldKey),
      drawer: const SideBar(),
      body: widget ?? const SizedBox(),
    );
  }
}
