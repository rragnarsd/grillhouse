import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/utils/scroll_configuration.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dashboard',
      scrollBehavior: NoScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTextTheme.textTheme,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      routerConfig: router,
    );
  }
}
