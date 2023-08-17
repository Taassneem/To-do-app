import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';

import 'app/app.dart';
import 'core/block/bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/database/sqflite/sqflite_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  sl<SqfliteHelper>().initDatabase();
  runApp(BlocProvider(
    create: (context) => TaskCubit(),
    child: const MyApp(),
  ));
}
