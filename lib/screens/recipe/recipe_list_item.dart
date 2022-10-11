import 'package:flutter/material.dart';
import 'package:flutter_application_v1/model/recipe.model.dart';

class RecipeListItem extends StatefulWidget {
  final Recipe recipe;
  final double costPrice;

  const RecipeListItem({required this.recipe, required this.costPrice, Key? key}) : super(key: key);

  @override
  _RecipeListItemState createState() => _RecipeListItemState();
}

class _RecipeListItemState extends State<RecipeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(widget.recipe.title, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF442C2E), fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            subtitle: Text(widget.recipe.category, overflow: TextOverflow.ellipsis, style: TextStyle(color: const Color(0xFF442C2E).withOpacity(0.7), fontSize: 18, fontWeight: FontWeight.w400)), 

            trailing: (widget.costPrice < widget.recipe.sellingPrice)
              ? Icon(
                  Icons.keyboard_double_arrow_up,
                  color: const Color(0xFF442C2E).withOpacity(0.8), 
                  size: 30,
                )
              : Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: const Color(0xFF442C2E).withOpacity(0.8),
                  size: 30,
                ),
            ),
          ]
        )
      )
    );
  }
}
