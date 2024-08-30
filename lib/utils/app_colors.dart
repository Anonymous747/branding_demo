import 'package:demo_branding/utils/brand_provider.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const grey = Color(0xFFF0F0EB);
  static const textColor = Color(0xFF49433C);
  static const primarySwatchColor = Colors.grey;
  static const white = Colors.white;

  static Color get primaryBrandColor => BrandProvider.brandedValue(
        cocaCola: const Color(0xFFC53C3C),
        pepsi: const Color(0xFFC6C0E7),
        fanta: const Color(0xFFFF8300),
      );
}
