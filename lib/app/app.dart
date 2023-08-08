import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'To do app',hard coded
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Image.asset(AppAssets.logo),),
      ),
    );
  }
}
