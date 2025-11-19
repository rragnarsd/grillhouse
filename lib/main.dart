import 'package:flutter/material.dart';
import 'package:grill_house/utils/routes.dart';
import 'package:grill_house/utils/scroll_configuration.dart';
import 'package:grill_house/utils/theme/app_colors.dart';
import 'package:grill_house/utils/theme/text_theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Grill House',
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
