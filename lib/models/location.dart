class Location {
  final int id;
  final String name;
  final String image;
  final String town;
  final String use;

  Location({
    required this.id,
    required this.name,
    required this.image,
    required this.town,
    required this.use,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final int idLocation = json['id'] ?? 0;
    String fullUrl = "https://cdn.thesimpsonsapi.com/200/location/${idLocation}.webp";
    String proxyUrl = "https://images.weserv.nl/?url=${Uri.encodeComponent(fullUrl)}";
    return Location(
    id: json['id'] ?? 0, 
    name: json['name'] ?? 'Sin Registro', 
    image: proxyUrl, 
    town: json['town'] ?? 'No Registro', 
    use: json['use'] ?? 'No Se Usa En Ningun Espacio',
    );
  }
}
