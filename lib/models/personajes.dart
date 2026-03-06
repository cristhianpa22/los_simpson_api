class Personajes {
  final int id;
  final String nombre;
  final String ocupacion;
  final String genero;
  final int edad;
  final String imagen;
  final String frase;

  Personajes({
    required this.id,
    required this.nombre,
    required this.ocupacion,
    required this.genero,
    required this.edad,
    required this.imagen,
    required this.frase,
  });

  factory Personajes.fromJson(Map<String, dynamic> json) {
    final int idPersonaje = json['id'] ?? 1;
    final List<dynamic> frasesList = json['phrases'] ?? [];
    final String fraseFinal = frasesList.isNotEmpty 
      ? frasesList[0].toString() 
      : '¡D\'oh! No tengo frases.';
    String fullUrl =
        "https://cdn.thesimpsonsapi.com/200/character/${idPersonaje}.webp";
    String proxyUrl =
        "https://images.weserv.nl/?url=${Uri.encodeComponent(fullUrl)}";
    return Personajes(
      id: json['id'] ?? 0,
      nombre: json['name'] ?? 'No identificadx',
      ocupacion: json['occupation'] ?? 'Vende BonIce en las tardes',
      genero: json['gender'] ?? 'bro?',
      edad: json['age'] ?? 0,
      imagen: proxyUrl,
      frase: fraseFinal,
    );
  }
}
