import 'package:flutter/material.dart';
import 'package:flutter_application_v1/controllers/ingredient.controller.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';
import 'package:flutter_application_v1/screens/ingredient/ingredient_list.dart';
import 'package:provider/provider.dart';

class IngredientAdd extends StatefulWidget {
  Ingredient? ingredient;

  IngredientAdd({this.ingredient, Key? key}) : super(key: key);

  @override
  _IngredientAddState createState() => _IngredientAddState();
}

class _IngredientAddState extends State<IngredientAdd> {
  late IngredientController _controller;

  final _tId = TextEditingController();
  final _tName = TextEditingController();
  final _tBaseQuantityForPriceCalculation = TextEditingController();
  final _tPrice = TextEditingController();
  final _tUnitMeasurement = TextEditingController();

  bool _isEdit = false;

  @override
  void initState() {
    super.initState();

    if (widget.ingredient == null) {
      _isEdit = false;
      _tId.text = '0';
    } else {
      _isEdit = true;
      _tId.text = widget.ingredient!.id.toString();
      _tName.text = widget.ingredient!.name;
      _tBaseQuantityForPriceCalculation.text = widget.ingredient!.baseQuantityForPriceCalculation.toString();
      _tPrice.text = widget.ingredient!.price.toString();
      _tUnitMeasurement.text = widget.ingredient!.unitMeasurement;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    _controller = Provider.of<IngredientController>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEEAE6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF442C2E),
        iconTheme: const IconThemeData(color: Color(0xFFFEEAE6)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => IngredientList()),
            );
          },
        ),
        title: const Text('Ingrediente', style: TextStyle(color: Color(0xFFFEEAE6), fontSize: 20, fontWeight: FontWeight.w400)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _tName,
                    cursorColor: const Color(0xFF442C2E),
                    decoration: const InputDecoration(
                        hintText: 'Nome',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF442C2E)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Favor preencher este campo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _tBaseQuantityForPriceCalculation,
                    cursorColor: const Color(0xFF442C2E),
                    decoration: const InputDecoration(
                        hintText: 'Quantidade base para cálculo',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF442C2E)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Favor preencher este campo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _tPrice,
                    cursorColor: const Color(0xFF442C2E),
                    decoration: const InputDecoration(
                        hintText: 'Preço',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF442C2E)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Favor preencher este campo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _tUnitMeasurement,
                    cursorColor: const Color(0xFF442C2E),
                    decoration: const InputDecoration(
                        hintText: 'Unidade de medida',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF442C2E)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Favor preencher este campo';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(50, 14, 50, 14),
                          backgroundColor: const Color(0xFF442C2E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var id = _isEdit ? int.parse(_tId.text) : null;
                            var ingredient = Ingredient(
                                id: id,
                                name: _tName.text,
                                baseQuantityForPriceCalculation: double.parse(_tBaseQuantityForPriceCalculation.text),
                                price: double.parse(_tPrice.text),
                                unitMeasurement: _tUnitMeasurement.text);

                            if (_isEdit) { 
                              _controller.update(ingredient);
                            } else {
                              _controller.create(ingredient);
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(_isEdit ? 'Produto atualizado com sucesso' : 'Produto adicionado com sucesso', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFFEEAE6), fontWeight: FontWeight.w400, fontSize: 18)),
                                duration: const Duration(milliseconds: 1500),
                                backgroundColor: const Color(0xFF442C2E).withOpacity(0.7),
                              ),
                            );
                          }
                        },
                        child: const Text('Salvar', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFFFEEAE6), fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ],
            ),
          )
        )
      )
    );
  }
}
