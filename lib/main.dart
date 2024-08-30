import 'package:demo_branding/localization/app_localizations.dart';
import 'package:demo_branding/screens/brand_screen.dart';
import 'package:demo_branding/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.grey,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryBrandColor),
          titleTextStyle: const TextStyle(color: AppColors.textColor),
          toolbarTextStyle: const TextStyle(color: AppColors.textColor),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatchColor)
            .copyWith(secondary: AppColors.primaryBrandColor)
            .copyWith(background: AppColors.white),
        useMaterial3: true,
      ),
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      home: const BrandScreen(),
    );
  }
}
