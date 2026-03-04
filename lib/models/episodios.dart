class Episodios {
  final int id;
  final String fecha_creacion;
  final int episodio;
  final String nombre_episodio;
  final int temporada;
  final String imagen;

  Episodios({
    required this.id,
    required this.fecha_creacion,
    required this.episodio,
    required this.nombre_episodio,
    required this.temporada,
    required this.imagen,
  });
  factory Episodios.fromJson(Map<String, dynamic> json) {
    final int idEpisodio = json['id'] ?? 1;
    String fullUrl = "https://cdn.thesimpsonsapi.com/200/episode/${idEpisodio}.webp";
    String proxyUrl =
        "https://images.weserv.nl/?url=${Uri.encodeComponent(fullUrl)}";
    return Episodios(
      id: json['id'] ?? 0,
      fecha_creacion: json['airdate'] ?? 'se creo quien sabe cuando',
      episodio: json['episode_number'] ?? 0,
      nombre_episodio: json['name'] ?? 'bart no nace',
      temporada: json['season'] ?? 0,
      imagen: proxyUrl,
    );
  }
}
