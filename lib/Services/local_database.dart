import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;
  static const int version = 1;
  static const String _tableName = "tasks";

  static Future<void> db() async {
    String path = '${await getDatabasesPath()}task.db';
    _db = await openDatabase(path, version: version,
        onCreate: (Database db, int version) async {
      return db.execute("""CREATE TABLE $_tableName(
      id INTERGER PRIMARY KEY AUTOINCCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      createAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
    });
  }

  static Future<int?> insert(String title, String description) async {
    final data = {"title": title, "description": description};
    return await _db?.insert(_tableName, data);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    List<Map<String, dynamic>> tasks = await _db!.query(_tableName);
    return tasks;
  }

  static Future<int> update(int id, String title, String description) async {
    final data = {
      "title": title,
      "description": description,
      "createdAt": DateTime.now().toString()
    };
    final task =
        await _db!.update(_tableName, data, where: "id = ?", whereArgs: [id]);
    return task;
  }

  static Future<void> delete(int id) async {
    try {
      await _db?.delete(_tableName, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }
}
