import 'package:flutter/material.dart';
import 'package:flutter_application_v1/controllers/ingredient.controller.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';
import 'package:provider/provider.dart';

class IngredientListItem extends StatefulWidget {
  final Ingredient ingredient;

  const IngredientListItem({required this.ingredient, Key? key}) : super(key: key);

  @override
  _IngredientListItemState createState() => _IngredientListItemState();
}

class _IngredientListItemState extends State<IngredientListItem> {
  late IngredientController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<IngredientController>(context);

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
                  child: Text(widget.ingredient.name, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF442C2E), fontSize: 20, fontWeight: FontWeight.w400)),
                ),
                subtitle: Text("${widget.ingredient.baseQuantityForPriceCalculation} ${widget.ingredient.unitMeasurement}",
                    overflow: TextOverflow.ellipsis, 
                    style: TextStyle(color: const Color(0xFF442C2E).withOpacity(0.7), fontSize: 18, fontWeight: FontWeight.w400)), 
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          titlePadding: const EdgeInsets.all(0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Color(0xFF442C2E),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                    Text("Exclusão de Registro", style: TextStyle(color: Color(0xFF442C2E), fontSize: 20, fontWeight: FontWeight.w400))
                                )
                              )
                            ]
                          ),
                          content: Text("Tem certeza que deseja excluir este registro?", style: TextStyle(color:const Color(0xFF442C2E).withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.w400)),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF442C2E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )
                              ),
                              child: const Text("OK", style: TextStyle(color: Color(0xFFFEEAE6), fontWeight: FontWeight.w400)),
                              onPressed: () {
                                _controller.delete(widget.ingredient.id!);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete, color: const Color(0xFF442C2E).withOpacity(0.8)),
                ),
              ),
            ]
          )
        )
      );
  }
}
