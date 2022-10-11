import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_application_v1/repository/ingredient.dao.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Ingredient])
abstract class AppDatabase extends FloorDatabase {
  IngredientDao get ingredientDao;
}
