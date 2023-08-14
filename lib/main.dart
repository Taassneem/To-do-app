import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/database/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  runApp(const MyApp());
}
