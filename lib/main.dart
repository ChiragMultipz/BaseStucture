import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:base_flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      startLocale: Locale('en'),
      child: MyApp()));
}