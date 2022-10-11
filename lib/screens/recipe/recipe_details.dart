import 'package:flutter/material.dart';
import 'package:flutter_application_v1/utils/utils.dart';
import 'package:flutter_application_v1/model/recipe.model.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;
  final double costPrice;

  const RecipeDetails({required this.recipe, required this.costPrice, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEAE6),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF442C2E)),
        backgroundColor: const Color(0xFFFEEAE6),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipe.title, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF442C2E), fontSize: 20)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text('Preço de Custo', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF442C2E), fontSize: 18)),
                              const SizedBox(width: 10),
                              Text("R\$ $costPrice", overflow: TextOverflow.ellipsis, style: TextStyle(color: const Color(0xFF442C2E).withOpacity(0.7), fontSize: 18, fontWeight: FontWeight.w400)),
                            ],
                          ),

                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text('Preço de Venda', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF442C2E), fontSize: 18)),
                              const SizedBox(width: 10),
                              Text("R\$ ${recipe.sellingPrice.toString()}", overflow: TextOverflow.ellipsis, style: TextStyle(color: const Color(0xFF442C2E).withOpacity(0.7), fontSize: 18, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Ingredientes', style: TextStyle(color: Color(0xFF442C2E), fontSize: 20)),
                              const SizedBox(height: 30),
                              Text(Utils().convertIngredientListToString(recipe), style: TextStyle(color: const Color(0xFF442C2E).withOpacity(0.7), fontSize: 18, fontWeight: FontWeight.w400))
                            ],
                          )
                        )
                      ),
                    ]
                  )
                )
              )
            )
          )
        ],
      ),
    );
  }
}
