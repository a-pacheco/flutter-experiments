import 'package:flutter_application_v1/model/recipe.model.dart';

class Utils {
  
  double calculateCostPrice(Recipe recipe) {
    double costPrice = 0.0;

    for (var ingredient in recipe.ingredients) {
      costPrice += (ingredient.amount * ingredient.price);
    }
    return costPrice;
  }

  String convertIngredientListToString(Recipe recipe) {
    String ingredients = '';

    for (var ingredient in recipe.ingredients) {
      ingredients += "${ingredient.amount} ${ingredient.unitMeasurement} ${ingredient.name} \n\n";
    }
    return ingredients;
  }
}
