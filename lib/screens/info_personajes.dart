import '../models/personajes.dart';
import 'package:flutter/material.dart';
class Detalles extends StatelessWidget {
  final Personajes personajes;
  const Detalles({super.key, required this.personajes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personajes.nombre)
      ),
      body: SingleChildScrollView(
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
                        color: Colors.blueGrey, 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),
                        child: SizedBox( 
                          height: 470,
                          width: 580,

                        child: Center(
                          child: Container( 
                            width: 480,
                            height: 440,
                            color: Colors.cyan,
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
                        color: Colors.white, 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                        child: SizedBox( 
                          height: 470,
                          width: 580,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            color: Colors.amberAccent,
          ),
        ),
      )
    );
  }
}
