import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';
import 'package:flutter_application_v1/model/recipe.model.dart';

class DBConnection {
}/*
  Database? _db;
  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'cost_control.db';

    _db = await openDatabase(join(dbpath, dbname), version: 1, onCreate: _createDB);

    return _db!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ingredient(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        baseQuantityForPriceCalculation REAL,
        price REAL,
        unitMeasurement TEXT
      )
    ''');
  }

  Future<List<Ingredient>> list() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'ingredient',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => Ingredient(id: items[i]['id'], name: items[i]['name'], baseQuantityForPriceCalculation: items[i]['baseQuantityForPriceCalculation'], price: items[i]['price'], unitMeasurement: items[i]['unitMeasurement']),
    );
  }
}*/


/*
  Future<void> createTask(Task task) async {
    final db = await database;
    await db.insert(
      'task',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(Task task) async {
    final db = await database;
    await db.delete(
      'task',
      where: 'id == ?',
      whereArgs: [task.id],
    );
  }

  Future<List<Task>> listTask() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'task',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => Task(
        id: items[i]['id'],
        title: items[i]['title'],
        createdAt: DateTime.parse(items[i]['createdAt']),
        completed: items[i]['completed'] == 1 ? true : false,
      ),
    );
  }
}*/
