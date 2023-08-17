// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/feature/task/data/model/task_model.dart';

class SqfliteHelper {
  late Database db;
  void initDatabase() async {
    await openDatabase(
      'Tasks.db',
      version: 1,
      onCreate: (Database db, int version) {
        db.execute('''CREATE TABLE Tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,note TEXT,date TEXT,startTime TEXT,endTime TEXT,color INTEGER,isComplete INTEGER)''').then((value) => print('DB created successfully'));
      },
      onOpen: (db) => print('DB opened'),

      // ignore: invalid_return_type_for_catch_error
    ).then((value) => db = value).catchError((e) => {print(e.toString())});
  }

  Future<List<Map<String, Object?>>> getFromDB() async {
    return db.rawQuery('SELECT * FROM Tasks');
  }

  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''
              INSERT INTO Tasks
              (title,note,date,startTime,endTime,color,isComplete)
              VALUES
              ('${model.title}','${model.note}','${model.date}','${model.startTime}','${model.endTime}','${model.color}','${model.isComplete}')
              ''');
  }

  Future<int> updateDB(int id) async {
    return await db
        .rawUpdate('UPDATE Tasks SET isComplete = ? WHERE id = ?', [1, id]);
  }

  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]);
  }
}
