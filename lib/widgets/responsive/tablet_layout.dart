import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigaton/header.dart';
import 'package:dashboard/widgets/navigaton/sidebar.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({
    super.key,
    this.widget,
    required this.currentRoute,
    required this.onRouteChanged,
  });

  final Widget? widget;
  final AppRoute currentRoute;
  final Function(AppRoute) onRouteChanged;

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppHeader(scaffoldKey: scaffoldKey),
      drawer: SideBar(
        currentRoute: widget.currentRoute,
        onRouteChanged: widget.onRouteChanged,
      ),
      body: widget.widget ?? const SizedBox(),
    );
  }
}
