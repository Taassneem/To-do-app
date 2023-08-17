import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/feature/auth/presentation/screens/OnBoarding_screen/on_boardingScreen.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen/home_screen.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Navigate();
  }

  // ignore: non_constant_identifier_names
  void Navigate() {
    bool isVisited = sl<CacheHelper>().getData(key: AppString.onBoardingKey)??false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) =>isVisited? const HomeScreen(): OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            const SizedBox(height: 25),
            Text(AppString.appName,
                style: Theme.of(context).textTheme.displayLarge)
          ],
        ),
      ),
    );
  }
}
