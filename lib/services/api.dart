import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/personajes.dart';

class Api {
  static const String _baseUrl = 'https://thesimpsonsapi.com/api/characters';
  

  Future<List<Personajes>> getPersonajes() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      List<dynamic> body = decodedData['results'];
      return body.map((dynamic item) => Personajes.fromJson(item)).toList();
    } else {
      throw ("No se pudo conectar con la API");
    }
  }
}
