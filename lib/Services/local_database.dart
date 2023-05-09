import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:plana/Model/task_card_model.dart';

class DatabaseHelper {
  static Database? _db;
  static const int version = 1;
  static const String _tableName = "tasks";
  List<Map<String, dynamic>> cardDetails = [];

  static Future<void> db() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}task.db';
      _db = await openDatabase(path, version: version,
          onCreate: (Database db, int version) async {
        return db.execute("""CREATE TABLE $_tableName(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       taskTitle TEXT,
      taskDescription TEXT,
      startTime TEXT,
      endTime TEXT,
      date TEXT,
      cardColor INTEGER,
      cardTextTitleColor INTEGER,
      createAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> insert(TaskCardModel taskCard) async {
    await _db?.insert(_tableName, taskCard.toMap());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    List<Map<String, Object?>> tasks = await _db!.query(_tableName);
    print(tasks.length);
    return tasks;
  }

  static Future<List<Map<String, dynamic>>> getItem(int? id) async {
    List<Map<String, dynamic>> task = await _db!
        .query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);
    return task;
  }

  static Future<void> update(TaskCardModel taskCard) async {
    await _db!.update(_tableName, taskCard.toMap(),
        where: "id = ?", whereArgs: [taskCard.id]);
  }

  static Future<void> delete(int id) async {
    try {
      await _db!.delete(_tableName, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }
}
