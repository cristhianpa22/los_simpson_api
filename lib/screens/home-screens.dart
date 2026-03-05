import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/personajes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/the-simpsons-6-logo-png-transparent.png',
              width: 80,
              height: 60,
              fit: BoxFit
                  .contain, // Controla cómo se ajusta la imagen al espacio
            ),
            SizedBox(width: 20),
            Text(
              'Springfield Galeria',
              style: TextStyle(
                color: Color.fromARGB(255, 38, 155, 250),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        backgroundColor: const Color.fromARGB(221, 255, 232, 29),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color.fromARGB(255, 50, 150, 207),
              child: Container(
                width: 900,
                height: 300,
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Galeria de personajes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "de los simpson",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "¡Bienvenidos a la ciudad de Springfield! Explora nuestra colección de personajes.",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -60,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'lib/assets/images/nube.webp',
                          width: 160,
                          height: 160,
                          fit: BoxFit
                              .contain, // Controla cómo se ajusta la imagen al espacio
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Personajes",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
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

                  final Personajes = snapShot.data!;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1.5,
                        ),
                    itemCount: Personajes.length,
                    itemBuilder: (context, index) {
                      final personaje = Personajes[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(personaje.imagen),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                personaje.nombre,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),

                              ElevatedButton(
                                onPressed: () {},
                                // onPressed: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           InfoPersonajes(personaje: personaje),
                                //     ),
                                //   );
                                // },
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
