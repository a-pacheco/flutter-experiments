import 'package:flutter/material.dart';
import 'package:flutter_application_v1/controllers/ingredient.controller.dart';
import 'package:flutter_application_v1/screens/home.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<IngredientController>.value(value: IngredientController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Rubik', dividerTheme: DividerThemeData(color: const Color(0xFF442C2E).withOpacity(0.5))),
          home: const Homepage(),
        )
      );
  }
}
