import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Marcador Tenis",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            child: ElevatedButton(onPressed: () {
              context.pushReplacement('/matches');
              print("Hola");
            }, child: Text("Nuevo Partido")),
          ),
        ));
  }
}
