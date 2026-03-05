import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/episodios.dart';
import 'home-screens.dart';

class EpisodiosScreens extends StatefulWidget{
  const EpisodiosScreens({super.key});

  @override
  State<EpisodiosScreens> createState() =>_EpisodiosscreensState();
}

class _EpisodiosscreensState extends State<EpisodiosScreens> {

  final Api _api = Api();

  List<Episodios> _episodios = [];
  List<int> _temporadas = [];
  int? _temporadaSeleccionada;

  bool _cargando = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cargarEpisodios();
  }

  Future<void> _cargarEpisodios() async {
    try {
      final lista = await _api.getEpisodios();

      final temporadasSet = lista.map((e) => e.temporada).toSet().toList()
        ..sort();

      setState(() {
        _episodios = lista;
        _temporadas = temporadasSet;
        _temporadaSeleccionada = _temporadas.isNotEmpty ? _temporadas.first : null;
        _cargando = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_cargando){
      return const Center(child:CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text('Error: $_error'));
    }
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              width: 100,
              height: 60,
              fit: BoxFit
                  .contain, // Controla cómo se ajusta la imagen al espacio
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
            SizedBox(width: 350),
            GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const ()),
              //   );
              // },
              child: Text(
                "Episodios",
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 47, 0),
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const ()),
              //   );
              // },
              child: Text(
                "Locaciones",
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 47, 0),
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(width: 600),
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
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child:SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:3, vertical: 1),
                    decoration: BoxDecoration(color: const Color.fromARGB(139, 10, 9, 10), borderRadius: BorderRadius.circular(5)),
                    child: const Text("Sprinfield Clasic", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 3),
                  const Text("Bienvenidos a Sprnfield", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.1)),
                  const SizedBox(height: 5),
                  const Text("Conoce las aventuras de los simpson", 
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, height: 1.1,color: Colors.grey)),
                  const SizedBox(height: 20),
                ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    height: 40,
                    child:  DropdownButtonFormField<int>(
                      initialValue: _temporadaSeleccionada,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8)
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      hint: Text('Selecciona la temporada'),
                      items: _temporadas.map((t){
                        return DropdownMenuItem<int>(
                          value: t,
                          child: Text('Temporada ${t}'),
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          _temporadaSeleccionada = value;
                        });
                      },
                    )
                  ) 
                ]
              ),
            ],
          ),
        )
      ),
    );
  }
}