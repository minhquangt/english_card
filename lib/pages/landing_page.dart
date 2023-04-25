import 'package:english_card/pages/home_page.dart';
import 'package:english_card/values/app_assets.dart';
import 'package:english_card/values/app_colors.dart';
import 'package:english_card/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome to",
                style: AppStyles.h3,
              ),
            )),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "English",
                    style: AppStyles.h2.copyWith(
                        color: AppColors.blackGrey,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Qoutes”",
                      style: AppStyles.h4.copyWith(height: 0.5),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 72.0),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      ((route) => false));
                },
                shape: CircleBorder(),
                fillColor: AppColors.lighBlue,
                child: Image.asset(AppAssets.rightArrow),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
