import 'package:floor/floor.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';

@dao
abstract class IngredientDao {
  @Query('SELECT * FROM Ingredient ORDER BY name')
  Future<List<Ingredient>> findAllIngredient();

  @Query("SELECT * FROM Ingredient WHERE id = :id")
  Future<Ingredient?> getIngredientById(int id);

  @insert
  Future<int> saveIngredient(Ingredient item);

  @update
  Future<int> updateIngredient(Ingredient item);

  @delete
  Future<int> deleteIngredient(Ingredient item);
}
