import 'package:flutter_application_v1/model/recipe_ingredient.model.dart';

class Recipe {
  int? id;
  final String category;
  final String title;
  final List<RecipeIngredient> ingredients;
  final double sellingPrice;
  double? costPrice;
  String? ingredientsAsString;
  //double? purchasePrice;

  Recipe({this.id, required this.category, required this.title, required this.ingredients, required this.sellingPrice});

/*
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'ingredients': ingredients,
    };
  }*/
}
