import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../di/dependency_injection.dart';

class InitializeApp {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> setupInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupDi();
    await EasyLocalization.ensureInitialized();
  }
}
