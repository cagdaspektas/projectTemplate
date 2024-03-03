import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/init/init_app.dart';
import 'presentiation/home/view/home_view.dart';
import 'product/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
          home: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: InitializeApp.navigatorKey,
        theme: ThemeManager.craeteTheme((AppThemeLight())),
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: const HomeView(),
      ));
    });
  }
}
