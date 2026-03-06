import 'package:flutter/material.dart';
import 'package:losimpson/screens/home-screens.dart';
import '../models/location.dart';
import '../screens/episodios-screens.dart';
import '../models/episodios.dart';
import '../screens/info_personajes.dart';
import '../models/personajes.dart';
import '../screens/home-screens.dart';

class LocationScreen extends StatelessWidget{

  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              width: 100,
              height: 60,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20),
            Text(
              'Springfield Galeria',
              style: TextStyle(
                fontFamily: 'SimpsonFont',
                color: Color.fromARGB(255, 83, 149, 203),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 150),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const EpisodiosScreens()),);
                },
                child: const Text(
                  "Episodios",
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 47, 0),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen ()  ),
                );
              },
              child: Text(
                "Personajes",
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 47, 0),
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(width: 300),
            SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Buscar personaje",
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.person),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 217, 0),
      ),
      
    );
  }
}
