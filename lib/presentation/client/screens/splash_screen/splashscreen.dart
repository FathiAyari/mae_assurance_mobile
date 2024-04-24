import 'dart:async';

import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var seen = GetStorage().read("seen");
  var user = GetStorage().read("user");
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      /* if (seen == 1) {
        if (user != null) {

        } else {}
      } else {

      }*/
      Get.toNamed(AppRouting.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Stack(
          children: [
            Container(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mae.png'),
                  ),
                ),
                child: ColorfulCircularProgressIndicator(
                  colors: [AppColors.primaryGreen, AppColors.primaryGreenLight],
                  strokeWidth: 5,
                  indicatorHeight: 250,
                  indicatorWidth: 250,
                ),
              ),
            ),
          ],
        )));
  }
}
