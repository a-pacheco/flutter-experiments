import 'package:flutter_application_v1/model/recipe_ingredient.model.dart';
import 'package:flutter_application_v1/model/recipe.model.dart';

class RecipeRepository {
  Future<List<Recipe>> findAll() async {

    List<RecipeIngredient> recipeIngredients = [
      RecipeIngredient(id: 1, name: 'Ingrediente 1', amount: 1.0, price: 10.0, unitMeasurement: ''),
      RecipeIngredient(id: 2, name: 'Ingrediente 2', amount: 0.1, price: 5.0, unitMeasurement: 'kg'),
      RecipeIngredient(id: 3, name: 'Ingrediente 3', amount: 0.25, price: 20.0, unitMeasurement: 'kg'),
    ];

    List<RecipeIngredient> recipeIngredients2 = [
      RecipeIngredient(id: 1, name: 'de biscoito TOSTINES Maisena', amount: 1.0, price: 10.0, unitMeasurement: 'pacote'),
      RecipeIngredient(id: 2, name: 'de manteiga', amount: 0.100, price: 20.0, unitMeasurement: 'kg'),
      RecipeIngredient(id: 3, name: 'de leite MOÇA', amount: 1, price: 20.0, unitMeasurement: 'lata ou caixa'),
      RecipeIngredient(id: 4, name: 'de leite líquido NINHO Forti+ Integral', amount: 0.395, price: 20.0, unitMeasurement: 'litro'),
      RecipeIngredient(id: 5, name: 'gemas peneiradas', amount: 2, price: 6.0, unitMeasurement: ''),
      RecipeIngredient(id: 6, name: 'de amido de milho', amount: 2, price: 2.0, unitMeasurement: 'colheres (sopa)'),
      RecipeIngredient(id: 7, name: 'de raspas da casda de limão', amount: 0.5, price: 2.0, unitMeasurement: 'colher (chá)'),
      RecipeIngredient(id: 8, name: 'de morangos', amount: 0.200, price: 10.0, unitMeasurement: 'kg'),
      RecipeIngredient(id: 9, name: 'de groselha', amount: 2, price: 1.0, unitMeasurement: 'colheres (sopa)'),
    ];

    List<Recipe> recipes = [
      Recipe(id: 1, sellingPrice: 2.0, category: 'Acompanhamentos e Entradas', title: 'Pão de alho com queijo', ingredients: recipeIngredients),
      Recipe(id: 2, sellingPrice: 10.0, category: 'Bolos e Tortas doces', title: 'Torta espelhada de morango tradicional', ingredients: recipeIngredients2),
    ];

    return recipes;
  }
}