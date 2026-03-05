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
        child: Column(
          children: [
            Row( 
              children: [
                Card(
                  child: Container(
                    width: 800,
                    height: 1500,
                    color: const Color.fromARGB(255, 233, 203, 9),
                  ),
                )
              ],
            )
          ],//hero
          
        ),
      )
    );
    
  }
}
