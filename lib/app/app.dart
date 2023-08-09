import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/utils/app_string.dart';

import '../feature/auth/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // title: 'To do app',hard coded
      title: AppString.appName,
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
  }
}
