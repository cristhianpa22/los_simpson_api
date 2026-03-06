import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/episodios.dart';
import '../models/personajes.dart';
import '../models/location.dart';

class Api {
  static const String _urlPersonajes =
      'https://thesimpsonsapi.com/api/characters';
  static const String _urlEpisodios = 'https://thesimpsonsapi.com/api/episodes';
  static const String _urlLocations = 'https://thesimpsonsapi.com/api/locations';

  Future<List<Personajes>> getPersonajes() async {
    final response = await http.get(Uri.parse(_urlPersonajes));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> body = decodedData['results'];
      return body.map((dynamic item) => Personajes.fromJson(item)).toList();
    } else {
      throw ("No se pudo conectar con la API");
    }
  }

  Future<List<Episodios>> getEpisodios() async {
    final response = await http.get(Uri.parse(_urlEpisodios));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> body = decodedData['results'];
      return body.map((dynamic item) => Episodios.fromJson(item)).toList();
    } else {
      throw ("No se pudo conectar con la API");
    }
  }

  Future<List<Location>> getLocaciones() async {
    final response = await http.get(Uri.parse(_urlLocations));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> body = decodedData['results'];
      return body.map((dynamic item) => Location.fromJson(item)).toList();
    } else {
      throw ("No se pudo conectar con la API");
    }
  }
}
