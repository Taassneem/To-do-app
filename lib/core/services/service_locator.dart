import 'package:get_it/get_it.dart';

import '../database/cache_helper.dart';

final sl = GetIt.instance;
void setup() {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
