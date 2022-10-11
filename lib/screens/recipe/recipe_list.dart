import 'package:flutter/material.dart';
import 'package:flutter_application_v1/services/recipe_service.dart';
import 'package:flutter_application_v1/screens/recipe/recipe_list_item.dart';
import 'package:flutter_application_v1/screens/recipe/recipe_details.dart';
import 'package:flutter_application_v1/model/recipe.model.dart';
import 'package:flutter_application_v1/utils/utils.dart';

class RecipeList extends StatefulWidget {
  final RecipeService recipeService = RecipeService();

  RecipeList({Key? key}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FutureBuilder(
          future: widget.recipeService.getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data ?? [];
            var sizeList = data.length;

            return sizeList == 0
              ? const Center(child: Text('Nenhuma receita cadastrada', style: TextStyle(color: Color(0xFF442C2E), fontWeight: FontWeight.w400, fontSize: 20)))
              : ListView.builder(
                  itemCount: sizeList,
                  itemBuilder: (context, i) {
                    Recipe recipe = data[i];
                    double costPrice = Utils().calculateCostPrice(recipe);

                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetails(recipe: data[i], costPrice: costPrice)));
                      },
                      child: RecipeListItem(recipe: data[i], costPrice: costPrice),
                    );
                  }
                );
          },
        ),
      ),
    );
  }
}
