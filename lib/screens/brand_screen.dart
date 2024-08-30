import 'package:demo_branding/localization/app_localizations.dart';
import 'package:demo_branding/utils/app_colors.dart';
import 'package:demo_branding/utils/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Brand demonstration',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
                '${AppLocalizations.of(context).appName} ${AppLocalizations.of(context).brandName}'),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(AppLocalizations.of(context).appColor),
                const SizedBox(width: 10),
                Container(
                  color: AppColors.primaryBrandColor,
                  width: 10,
                  height: 10,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(AppLocalizations.of(context).appColor),
                const SizedBox(width: 10),
                Image.asset(
                  ImagePathProvider.logo,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(AppLocalizations.of(context).appLogo),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  SvgPathProvider.bottle,
                  height: 100,
                  width: 100,
                  color: AppColors.primaryBrandColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
