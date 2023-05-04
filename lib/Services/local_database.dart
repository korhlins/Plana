import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

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
      cardColor INTEGER,
      cardTextTitleColor INTEGER,
      createAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      });
      print(_db?.isOpen);
    } catch (e) {
      print(e);
    }
  }

  Future<int?> insert(
      {required String taskTitle,
      required String taskDescription,
      required String startTime,
      required String endTime,
      int? cardTextTitleColor,
      int? cardColor}) async {
    final data = {
      "taskTitle": taskTitle,
      "taskDescription": taskDescription,
      "startTime": startTime,
      "endTime": endTime,
      "cardColor": cardColor,
      "cardTextTitleColor": cardTextTitleColor,
    };
    print(data["taskTitle"]);
    return await _db?.insert(_tableName, data);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    List<Map<String, Object?>> tasks = await _db!.query(_tableName);
    return tasks;
  }

  static Future<List<Map<String, dynamic>>> getItem(int? id) async {
    List<Map<String, dynamic>> task = await _db!
        .query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);
    return task;
  }

  static Future<int> update(
      int? id,
      String taskTitle,
      String taskDescription,
      String startTime,
      String endTime,
      int cardTextTitleColor,
      int cardColor) async {
    final data = {
      "taskTitle": taskTitle,
      "taskDescription": taskDescription,
      "startTime": startTime,
      "endTime": endTime,
      "cardColor": cardColor,
      "cardTextTitleColor": cardTextTitleColor,
      "createAt": DateTime.now().toString()
    };
    final task =
        await _db!.update(_tableName, data, where: "id = ?", whereArgs: [id]);
    return task;
  }

  static Future<void> delete(int id) async {
    try {
      await _db!.delete(_tableName, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }
}
