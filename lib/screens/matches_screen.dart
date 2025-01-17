import 'package:flutter/material.dart';
import 'package:po_obligatoria_t3_tenis/models/partido_model.dart';
import 'package:po_obligatoria_t3_tenis/screens/splash_screen.dart';
import 'package:po_obligatoria_t3_tenis/screens/widget/marcador_widget.dart';
import 'package:po_obligatoria_t3_tenis/services/tenis_service.dart';

class MatchesScreen extends StatefulWidget {
  
  MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    TenisService ts = TenisService();
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: FutureBuilder(
          future: ts.getPartido(),
          builder: (BuildContext context,
              AsyncSnapshot<Partido> snapshot) {
            return (!snapshot.hasData)
                ? SplashScreen()
                :MarcadorWidget(datos: snapshot.data!,); 
                
          },
        ));
  }
}
