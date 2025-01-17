import 'package:flutter/material.dart';
import 'package:po_obligatoria_t3_tenis/menu/router/menu_router.dart';
import 'package:po_obligatoria_t3_tenis/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       colorSchemeSeed: Color.fromARGB(0, 24, 151, 24), 
       scaffoldBackgroundColor:Color.fromRGBO(114, 184, 103, 1) ,
       appBarTheme: AppBarTheme(backgroundColor:Color.fromRGBO(53, 104, 45, 1.0) ,centerTitle: true)
      ),
      title: 'Marcador Tenis',
      routerConfig: appRouter,
    );
  }
}