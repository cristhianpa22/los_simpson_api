class Personajes {
  final int id;
  final String nombre;
  final String ocupacion;
  final String genero;
  final int edad;
  final String imagen;

  Personajes({
    required this.id,
    required this.nombre,
    required this.ocupacion,
    required this.genero,
    required this.edad,
    required this.imagen,
  });

  factory Personajes.fromJson(Map<String, dynamic> json) {
    final int idPersonaje = json['id'] ?? 1;
    String fullUrl = "https://thesimpsonsapi.com/character/$idPersonaje.webp";
    String proxyUrl =
        "https://images.weserv.nl/?url=${Uri.encodeComponent(fullUrl)}";
    return Personajes(
      id: json['id'] ?? 0,
      nombre: json['name'] ?? 'no importa',
      ocupacion: json['occupation'] ?? 'mas desocupado',
      genero: json['gender'] ?? 'se le parte la canoa',
      edad: json['age'] ?? 0,
      imagen: proxyUrl,
    );
  }
}
