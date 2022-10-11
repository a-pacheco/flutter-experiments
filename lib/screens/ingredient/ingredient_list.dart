import 'package:flutter/material.dart';
import 'package:flutter_application_v1/controllers/ingredient.controller.dart';
import 'package:flutter_application_v1/screens/Home.dart';
import 'package:flutter_application_v1/screens/ingredient/ingredient_add.dart';
import 'package:flutter_application_v1/screens/ingredient/ingredient_list_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class IngredientList extends StatefulWidget {

  IngredientList({Key? key}) : super(key: key);

  @override
  _IngredientListState createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {

  late IngredientController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<IngredientController>(context);
    
    return Scaffold(
        backgroundColor: const Color(0xFFFEEAE6),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Ingredientes', style: TextStyle(color: Color(0xFF442C2E), fontSize: 20, fontWeight: FontWeight.w400)),
          iconTheme: const IconThemeData(color: Color(0xFF442C2E)),
          backgroundColor: const Color(0xFFFEEAE6),
        ),
        body: Scrollbar(
          child: Observer(builder: (_) {
            var data = _controller.list;
            var sizeList = data.length;

            return sizeList == 0
                ? const Center(
                    child: Text('Nenhum ingrediente cadastrado',
                        style: TextStyle(
                          color: Color(0xFF442C2E),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                  )
                : ListView.builder(
                    itemCount: sizeList,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => IngredientAdd(ingredient: data[i])),
                          );
                        },
                        child: IngredientListItem(ingredient: data[i]),
                      );
                    }
                  );
          }
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF442C2E),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: <Widget>[
                IconButton(
                  tooltip: 'Home',
                  icon: const Icon(Icons.home, color: Color(0xFFFEEAE6)),
                  onPressed: () => Future(
                      () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Homepage()), (route) => false)
                    )
                  ),
              ]
            )
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF442C2E),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => IngredientAdd(ingredient: null)),
          );
        },
        child: const Icon(Icons.add, color: Color(0xFFFEEAE6)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
