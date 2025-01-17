import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:po_obligatoria_t3_tenis/models/partido_model.dart';
import 'package:po_obligatoria_t3_tenis/services/tenis_service.dart';

class MarcadorWidget extends StatefulWidget {
  int puntosJ1 = 0;
  int puntosJ2 = 0;
  int gamesJ1 = 0;
  int gamesJ2 = 0;
  int setsJ1 = 0;
  int setsJ2 = 0;
  bool saque =true;
  String setAnterior1="";
  String setAnterior2="";
  String setAnterior3="";
  Partido datos;
   MarcadorWidget({super.key,required this.datos});

  @override
  State<MarcadorWidget> createState() => _MarcadorWidgetState();
}

class _MarcadorWidgetState extends State<MarcadorWidget> {
  TenisService ts = TenisService();
  @override
  Widget build(BuildContext context) {
    
    void sumaPuntuacionJ1() {
  if (widget.puntosJ1 == 0) {
    widget.puntosJ1 = 15;
  } else if (widget.puntosJ1 == 15) {
    widget.puntosJ1 = 30;
  } else if (widget.puntosJ1 == 30) {
    widget.puntosJ1 = 40;
  } else if (widget.puntosJ1 == 40) {
    if (widget.puntosJ2 < 40) {

      widget.puntosJ1 = 0;
      widget.puntosJ2 = 0;
      widget.gamesJ1++;
      widget.saque = !widget.saque;

      if (widget.gamesJ1 >= 6 && widget.gamesJ1 - widget.gamesJ2 >= 2) {
        if(widget.setAnterior1=="") {
        widget.setAnterior1 = "${widget.gamesJ1},${widget.gamesJ2}";
        }else{
          if(widget.setAnterior2==""){
            widget.setAnterior2 = "${widget.gamesJ1},${widget.gamesJ2}";
          }else{
            if(widget.setAnterior3==""){
            widget.setAnterior3 = "${widget.gamesJ1},${widget.gamesJ2}";
          }
          }
        }
        widget.setsJ1++;
        widget.gamesJ1 = 0;
        widget.gamesJ2 = 0;
        if (widget.setsJ1 == 2) {
          showDialogGanador(1);
        }
      }
    } else if (widget.puntosJ2 == 40) {
      
      widget.puntosJ1 = 45;
    } else if (widget.puntosJ2 == 45) {
      
      widget.puntosJ2 = 40;
    }
  } else if (widget.puntosJ1 == 45) {
   
    widget.puntosJ1 = 0;
    widget.puntosJ2 = 0;
    widget.gamesJ1++;
    widget.saque = !widget.saque;

  }
  setState(() {
    
  });
}
    void sumaPuntuacionJ2() {
  if (widget.puntosJ2 == 0) {
    widget.puntosJ2 = 15;
  } else if (widget.puntosJ2 == 15) {
    widget.puntosJ2 = 30;
  } else if (widget.puntosJ2 == 30) {
    widget.puntosJ2 = 40;
  } else if (widget.puntosJ2 == 40) {
    if (widget.puntosJ1 < 40) {
      
      widget.puntosJ2 = 0;
      widget.puntosJ1 = 0;
      widget.gamesJ2++;
      widget.saque = !widget.saque;

      
      if (widget.gamesJ2 >= 6 && widget.gamesJ2 - widget.gamesJ1 >= 2) {
        if(widget.setAnterior1=="") {
        widget.setAnterior1 = "${widget.gamesJ1},${widget.gamesJ2}";
        }else{
          if(widget.setAnterior2==""){
            widget.setAnterior2 = "${widget.gamesJ1},${widget.gamesJ2}";
          }else{
            if(widget.setAnterior3==""){
            widget.setAnterior3 = "${widget.gamesJ1},${widget.gamesJ2}";
          }
          }
        }
        widget.setsJ2++;
        widget.gamesJ1 = 0;
        widget.gamesJ2 = 0;

        
         if (widget.setsJ2 == 2) {
           showDialogGanador(2);
         }
      }
    } else if (widget.puntosJ1 == 40) {
      
      widget.puntosJ2 = 45;
    } else if (widget.puntosJ1 == 45) {
     
      widget.puntosJ1 = 40;
    }
  } else if (widget.puntosJ2 == 45) {
    
    widget.puntosJ2 = 0;
    widget.puntosJ1 = 0;
    widget.gamesJ2++;
    widget.saque = !widget.saque;

  
  }
  setState(() {
    
  });
  
}
    return SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ContainerPerso(
                                  width: 108, height: 60, text: "8.16"),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/crown.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  const Text(
                                    "2025",
                                    style: TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 50,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Image.asset(
                                    'assets/images/crown.png',
                                    width: 50,
                                    height: 50,
                                  )
                                ],
                              ),
                              ContainerPerso(
                                  width: 108, height: 60, text: "8.24")
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 59, 120, 217)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 59, 120, 217)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "PREVIOUS SET",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25),
                              ),
                            ),
                            Row(
                              children: [
                                Text("SETS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                SizedBox(
                                  width: 23,
                                ),
                                Text("GAMES",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                SizedBox(
                                  width: 11,
                                ),
                                Text("POINTS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                SizedBox(
                                  width: 19,
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                ContainerPerso(
                                    width: 40, height: 70, text: (widget.setAnterior1.length == 3)?widget.setAnterior1.substring(0,1):""),
                                const SizedBox(width: 10),
                                ContainerPerso(
                                    width: 40, height: 70, text: (widget.setAnterior2.length == 3)?widget.setAnterior2.substring(0,1):""),
                                const SizedBox(width: 10),
                                ContainerPerso(
                                    width: 40, height: 70, text: (widget.setAnterior3.length ==3)?widget.setAnterior3.substring(0,1):""),
                                const SizedBox(width: 10),
                                ContainerPerso(
                                    width: 40, height: 70, text: ""),
                              ]),
                              ContainerPerso(
                                  width: 650,
                                  height: 70,
                                  text: widget.datos.jugador1.nombre,
                                  saque: widget.saque,
                                  img: widget.datos.jugador1.img
                                  ),

                              Row(
                                children: [
                                  ContainerPerso(
                                      width: 72,
                                      height: 70,
                                      text: widget.setsJ1.toString()),
                                  const SizedBox(width: 10),
                                  ContainerPerso(
                                      width: 72,
                                      height: 70,
                                      text: widget.gamesJ1.toString()),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {},
                                    child: ContainerPerso(
                                        width: 72,
                                        height: 70,
                                        text: widget.puntosJ1.toString()),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Text(
                          "   vs",
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                ContainerPerso(
                                    width: 40, height: 70, text: (widget.setAnterior1.length ==3)?widget.setAnterior1.substring(2,3):""),
                                const SizedBox(width: 10),
                                ContainerPerso(
                                    width: 40, height: 70, text: (widget.setAnterior2.length ==3 )?widget.setAnterior2.substring(2,3):""),
                                const SizedBox(width: 10),
                                ContainerPerso(width: 40, height: 70, text: (widget.setAnterior3.length ==3)?widget.setAnterior3.substring(2,3):""),
                                const SizedBox(width: 10),
                                ContainerPerso(width: 40, height: 70, text: ""),
                              ]),
                              ContainerPerso(
                                  width: 650,
                                  height: 72,
                                  text: widget.datos.jugador2.nombre,
                                  saque: !widget.saque,
                                  img: widget.datos.jugador2.img
                                  ),
                                  
                                  
                              Row(
                                children: [
                                  ContainerPerso(
                                      width: 72,
                                      height: 70,
                                      text: widget.setsJ2.toString()),
                                  const SizedBox(width: 10),
                                  ContainerPerso(
                                      width: 72,
                                      height: 70,
                                      text: widget.gamesJ2.toString()),
                                  const SizedBox(width: 10),
                                  ContainerPerso(
                                      width: 72,
                                      height: 70,
                                      text: widget.puntosJ2.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 500,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 33, 35, 81),
                                  width: 4)),
                          child: Column(
                            children: [
                              const Text(
                                "CHALLENGES REMAINING",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 420,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 33, 35, 81)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        widget.datos.jugador1.nombre,
                                        style: const TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 33, 35, 81)),
                                    child:  const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Center(
                                        child: Text(
                                          "6",
                                          style: TextStyle(
                                              color: Colors.yellowAccent,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 420,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 33, 35, 81)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        widget.datos.jugador2.nombre,
                                        style: const TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 33, 35, 81)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Center(
                                        child: Text(
                                         "6",
                                          style: TextStyle(
                                              color: Colors.yellowAccent,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton.extended(
                                onPressed: () {
                                  setState(() {
                                    sumaPuntuacionJ1(); 
                                  });
                                },
                                label: Text("Sumar punto a " +
                                    widget.datos.jugador1.nombre),
                              ),
                              FloatingActionButton.extended(
                                onPressed: () {
                                  setState(() {
                                    sumaPuntuacionJ2();
                                  });
                                  
                                },
                                label: Text("Sumar Punto a " +
                                   widget.datos.jugador2.nombre),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          87,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 59, 120, 217)),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          87,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 59, 120, 217)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  "WIMBELDON",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          92,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 59, 120, 217)),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          92,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 59, 120, 217)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
  }


  void showDialogGanador(int jugador) {
    TenisService ts = TenisService();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("¡El ${(jugador == 1)?widget.datos.jugador1.nombre:widget.datos.jugador2.nombre} ha ganado el partido!"),
        content: Text("El ${(jugador == 1)?widget.datos.jugador1.nombre:widget.datos.jugador2.nombre} ha ganado 2 sets y ha vencido al otro jugador."),
        actions:[
          TextButton(
            onPressed: () {
              widget.datos.finalizado=true;
              if(jugador == 1){
                  widget.datos.jugador1.ganador = true;
              }else{
                widget.datos.jugador2.ganador = true;
              }
              widget.datos.puntuacion ="${widget.setAnterior1}-${widget.setAnterior2}${(widget.setAnterior3!="")? "-${widget.setAnterior3}":""}";
              ts.patchPartidosFinalizados(widget.datos.id!,widget.datos);
              reiniciarPartido();
              context.pushReplacement('/home');
            },
            child: const Text("Guardar Partido."),
          ),
          TextButton(
            onPressed: () {
              reiniciarPartido();
              context.pushReplacement('/home');
            },
            child: const Text("No guardar y salir."),
          ),
        ],
      );
    },
  );
}
void reiniciarPartido() {
  setState(() {
    widget.setsJ1 = 0;
    widget.setsJ2 = 0;
    widget.gamesJ1 = 0;
    widget.gamesJ2 = 0;
    widget.setAnterior1 = "";
    widget.setAnterior2 = "";
    widget.setAnterior3 = "";
  });
}
}
class ContainerPerso extends StatefulWidget {
  double width;
  double height;
  String text;
  String? img;
  bool? saque;
  ContainerPerso(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      this.img,
      this.saque});

  @override
  State<ContainerPerso> createState() => _ContainerPersoState();
}

class _ContainerPersoState extends State<ContainerPerso> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 33, 35, 81)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: (widget.img!=null && widget.saque != null) ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(widget.img!,fit: BoxFit.fill,),
              Text(
            (widget.text == "45") ? "AD":widget.text,
            style: const TextStyle(
                color: Colors.yellowAccent,
                fontSize: 50,
                fontWeight: FontWeight.w700),
          ),
            (widget.saque!)?
            Container(
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellowAccent,width: 4),
                borderRadius: BorderRadius.circular(40)
              ),
            ):
            Container()
            ],
          )
          :Text(
            (widget.text == "45") ? "AD":widget.text,
            style: const TextStyle(
                color: Colors.yellowAccent,
                fontSize: 50,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
  
}


