import 'package:get_it/get_it.dart';

import '../database/cache/cache_helper.dart';
import '../database/sqflite/sqflite_helper.dart';

final sl = GetIt.instance;
void setup() {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper());
}
