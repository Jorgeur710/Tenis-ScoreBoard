// To parse this JSON data, do
//
//     final partido = partidoFromJson(jsonString);

import 'dart:convert';

Map<String, Partido> partidoFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Partido>(k, Partido.fromJson(v)));

String partidoToJson(Map<String, Partido> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Partido {
    Jugador jugador1;
    Jugador jugador2;
    bool finalizado;
    String? puntuacion;
    String? id;

    Partido({
        required this.jugador1,
        required this.jugador2,
        required this.finalizado,
        this.puntuacion,
        this.id
    });

    factory Partido.fromJson(Map<String, dynamic> json) => Partido(
        jugador1: Jugador.fromJson(json["Jugador1"]),
        jugador2: Jugador.fromJson(json["Jugador2"]),
        finalizado: json["finalizado"],
        puntuacion: json["puntuacion"],
    );

    Map<String, dynamic> toJson() => {
        "Jugador1": jugador1.toJson(),
        "Jugador2": jugador2.toJson(),
        "finalizado": finalizado,
        "puntuacion": puntuacion,
    };
    @override
  String toString() {
    return '''
  Jugador 1: $jugador1
  Jugador 2: $jugador2
  finalizado: $finalizado
  puntuacion: $puntuacion
  id:$id
''';
  }
}

class Jugador {
    String img;
    String nombre;
    bool ganador;

    Jugador({
        required this.img,
        required this.nombre,
        required this.ganador
    });

    factory Jugador.fromJson(Map<String, dynamic> json) => Jugador(
        img: json["img"],
        nombre: json["nombre"],
        ganador: json["ganador"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "nombre": nombre,
        "ganador": ganador,
    };
    @override
  String toString() {
    return '''
Nombre: $nombre
''';
  }
}
