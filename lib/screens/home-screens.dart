import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/personajes.dart';
    
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
           Image.asset(
                    'lib/assets/images/the-simpsons-6-logo-png-transparent.png',
                    width: 80,
                    height: 60,
                    fit: BoxFit.contain, // Controla cómo se ajusta la imagen al espacio
                  ),
                  SizedBox(width: 20),
          Text('Springfield Galeria',style: TextStyle(color: Color.fromARGB(255, 38, 155, 250),fontSize: 20,fontWeight: FontWeight.bold),),
          
        ],),
        
        backgroundColor: const Color.fromARGB(221, 255, 232, 29),


      ),
    );
  }
}