import '../models/personajes.dart';
import 'package:flutter/material.dart';

class Detalles extends StatelessWidget {
  final Personajes personajes;
  const Detalles({super.key, required this.personajes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 223, 233),
      appBar: AppBar(
        title: Text(personajes.nombre,
        style: TextStyle(fontFamily:'SimpsonFont',color: const Color.fromARGB(255, 51, 46, 111),fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(255, 157, 162, 219),
            height: 2.0,
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Center(
            child: Card(
            // ignore: sort_child_properties_last
            child: Container(
              height: 500,
              width: 1200,
              padding: EdgeInsets.only(top: 15,bottom: 10,left: 19,right: 10),
              child: Row(
                children: [
                  //columna de la foto
                  Column(
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        color: const Color.fromARGB(255, 2, 133, 150), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),
                        child: SizedBox( 
                          height: 470,
                          width: 580,

                        child: Center(
                          child: Container( 
                            width: 480,
                            height: 440,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 213, 234, 255),
                            ),
                            padding: EdgeInsets.only(top: 5,left: 5,right: 5),
                            child: ClipRRect( 
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                personajes.imagen,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                        ),
                        ),
                        
                      ),
                    ],
                  ),
                  //columna de la info
                  Column(
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        color: const Color.fromARGB(255, 252, 248, 221), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                        child: SizedBox( 
                          height: 470,
                          width: 580,
                        child: Padding(padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Center(
                                      child: const Text("Tarjeta De Personaje"),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [const Text("Nombre: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  personajes.nombre,
                                  style: 
                                  const TextStyle(
                                    fontSize: 18
                                  ),
                                ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text("Ocupacion: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Text(personajes.ocupacion ?? 'Sin ocupación', style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text("Genero: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Text(personajes.genero, style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text("Edad: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Text("${personajes.edad}", style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                              const SizedBox(height: 30), // Espacio grande antes de la frase
                              
                              Center(
                                child: Stack(
                                  alignment: Alignment.center, 
                                  children: [
                                    Icon(
                                      Icons.format_quote_rounded, 
                                      color: Colors.amber.withOpacity(0.3), 
                                      
                                      size: 120, 
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                      personajes.frase , 
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.1), 
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.red), 
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.favorite, color: Colors.red, size: 18),
                                          SizedBox(width: 5),
                                          Text("Me gusta", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 15), 

                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    onTap: () {}, 
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.share, color: Colors.blue, size: 18),
                                          SizedBox(width: 5),
                                          Text("Compartir", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ],
                          ),
                        ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            color: const Color.fromARGB(255, 238, 191, 2),
          ),
        ),
      )
    );
  }
}
