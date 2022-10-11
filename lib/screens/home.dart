import 'package:flutter/material.dart';
import 'package:flutter_application_v1/screens/ingredient/ingredient_list.dart';
import 'package:flutter_application_v1/screens/recipe/recipe_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    String title = 'Olá, Teste';

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Color(0xFFFEEAE6), fontSize: 20, fontWeight: FontWeight.w400)),
        backgroundColor: const Color(0xFF442C2E),
        actions: <Widget>[
          IconButton(
            tooltip: 'Notificações',
            icon: const Icon(Icons.notifications, color: Color(0xFFFEEAE6)),
            onPressed: () {},
          ),
          PopupMenuButton<int>(
            constraints: const BoxConstraints.expand(width: 320, height: 360),
            icon: const Icon(Icons.more_vert, color: Color(0xFFFEEAE6)),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: ListTile(leading: Icon(Icons.cake, color: const Color(0xFF442C2E).withOpacity(0.5)), title: const Text('Cadastro de Ingredientes')),
                onTap: () => Future(
                    () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IngredientList())),
                  )
                ),
              PopupMenuItem<int>(value: 1, child: ListTile(leading: Icon(Icons.handshake_rounded, color: const Color(0xFF442C2E).withOpacity(0.5)), title: const Text('Cadastro de Fornecedores'))), // TODO: Colocar cor e definir o font style
              PopupMenuItem<int>(value: 2, child: ListTile(leading: Icon(Icons.groups, color: const Color(0xFF442C2E).withOpacity(0.5)), title: const Text('Cadastro de Usuários'))), // TODO: Colocar cor e definir o font style
              PopupMenuItem<int>(value: 3, child: ListTile(leading: Icon(Icons.bubble_chart, color: const Color(0xFF442C2E).withOpacity(0.5)), title: const Text('Relatórios'))), // TODO: Colocar cor e definir o font style
              PopupMenuItem<int>(value: 4, child: ListTile(leading: Icon(Icons.settings, color: const Color(0xFF442C2E).withOpacity(0.5)), title: const Text('Configurações'))), // TODO: Colocar cor e definir o font style
              const PopupMenuDivider(),
              PopupMenuItem<int>(value: 5, child: ListTile(leading: Icon(Icons.logout, color: const Color(0xFF442C2E).withOpacity(0.5)), title: const Text('Sair'))), // TODO: Colocar cor e definir o font style
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFEEAE6), // #442C2E   //#FEEAE6
      body: Column(
        children: [
          RecipeList(),
        ],
      ),
    );
  }
}
