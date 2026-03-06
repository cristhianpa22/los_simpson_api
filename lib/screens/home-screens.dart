import 'package:flutter/material.dart';
import 'package:losimpson/screens/info_personajes.dart';
import 'package:losimpson/screens/locations-screen.dart';
import '../services/api.dart';
import '../models/personajes.dart';
import '../screens/episodios-screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(142, 255, 217, 0),
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
                  MaterialPageRoute(builder: (context) => const LocationScreen()),
                );
              },
              child: Text(
                "Locaciones",
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
      body: Center(
        child: Column(
          children: [
            const Divider(
              color: Color.fromARGB(255, 170, 187, 223),
              thickness: 5,
              height: 5,
            ),
            SizedBox(height: 20),
            Card(
              color: const Color.fromARGB(255, 74, 74, 74),
              child: SizedBox(
                width: 900,
                height: 400,
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    child: SizedBox(
                      width: 870,
                      height: 370,
                      child: Align(
                        alignment: Alignment.center,
                        child: Card(
                          color: const Color.fromARGB(248, 75, 74, 75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Color.fromARGB(255, 1, 1, 1),
                              width: 6,
                            ),
                          ),
                          child: SizedBox(
                            width: 830,
                            height: 330,
                            child: Row(
                              children: [
                                SizedBox(width: 30),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 350,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: const Text(
                                        '"Springfield puede tener muchos problemas, pero sigue siendo nuestro hogar."',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      width: 170,
                                      height: 70,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromARGB(
                                          255,
                                          22,
                                          110,
                                          197,
                                        ),
                                      ),
                                      child: const Text(
                                        "Lisa Simpson",
                                        style: TextStyle(
                                          fontFamily: 'SimpsonFont',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 80),
                                Column(
                                  children: [
                                    SizedBox(height: 60),
                                    Container(
                                      width: 250,
                                      height: 250,
                                      child: Image.network(
                                        'lib/assets/images/lisa.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Personajes",
              style: TextStyle(
                fontFamily: 'SimpsonFont',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Personajes>>(
                future: Api().getPersonajes(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapShot.hasError) {
                    return Center(
                      child: Text('Error al cargar los personajes'),
                    );
                  }

                  final personajes = snapShot.data!;
                  return GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.3,
                        ),
                    itemCount: personajes.length,
                    itemBuilder: (context, index) {
                      final personaje = personajes[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Hero(
                                tag: personaje.nombre,
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                    personaje.imagen,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                personaje.nombre,
                                style: const TextStyle(
                                  fontFamily: 'SimpsonFont',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),

                              ElevatedButton(
                                
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  foregroundColor: const Color.fromARGB(255,231,243,2,),
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Detalles(personajes: personaje),
                                    ),
                                  );
                                },
                                child: const Text('Ver personaje'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
