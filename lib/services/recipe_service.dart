import 'package:flutter_application_v1/repository/recipe.repository.dart';
import 'package:flutter_application_v1/model/recipe.model.dart';

class RecipeService {
  RecipeRepository repository = RecipeRepository();

  Future<List<Recipe>> getAll() {
    return repository.findAll();
  }
}
