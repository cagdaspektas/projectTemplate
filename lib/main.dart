import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/app.dart';
import 'package:flutter_bloc_template/core/init/init_app.dart';

import 'product/constants/app_constants.dart';
import 'product/localeManager/locale_manger.dart';

Future<void> main() async {
  await InitializeApp.setupInit();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance!.supportedLocales,
      path: ApplicationConstants.languageAssetsPath,
      startLocale: LanguageManager.instance!.trLocale,
      child: const MyApp(),
    ),
  );
}
