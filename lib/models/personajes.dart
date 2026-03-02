class Personajes {
  final int id;
  final String nombre;
  final String ocupacion;
  final String genero;
  final String edad;
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
  String originalUrl = json['portrait_path'] ?? 'https://cdn.thesimpsonsapi.com/500/character/1.webp';
  String proxyUrl = "https://corsproxy.io/?${Uri.encodeComponent(originalUrl)}";

    return Personajes(
      id: json['id'],
      nombre: json['name'],
      ocupacion: json['occupation'],
      genero: json['gender'],
      edad: json['age'],
      imagen: proxyUrl,
      frase: json['phrases']
    );
  }
}