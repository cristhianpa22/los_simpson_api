import 'package:flutter/material.dart';
import '../models/episodios.dart';

class Modal extends StatelessWidget {
  final Episodios episodio;

  const Modal({super.key, required this.episodio});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 520, maxHeight: 700),
      decoration: BoxDecoration(
        color: const Color.fromARGB(223, 24, 24, 22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(80, 255, 217, 0),
          width: 15,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(20, 0, 0, 0),
            offset: const Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagen del episodio
            Hero(tag: 'episodio_${episodio.id}',
            child:
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                child: Image.network(
                  episodio.imagen,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                  errorBuilder: (_, __, ___) => Container(
                    height: 220,
                    color: const Color.fromARGB(255, 40, 40, 38),
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Temporada y episodio (badge amarillo)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'TEMPORADA ${episodio.temporada} · EPISODIO ${episodio.episodio}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Nombre del episodio
                  Text(
                    episodio.nombre_episodio,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  // Fecha de creación
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: const Color.fromARGB(255, 83, 149, 203),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Fecha de emisión: ${episodio.fecha_creacion}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 170, 187, 223),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Descripción
                  const Text(
                    'Sinopsis',
                    style: TextStyle(
                      color: Color.fromARGB(255, 83, 149, 203),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    episodio.descripcion,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  // Botón cerrar
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.yellow, size: 20),
                      label: const Text(
                        'Cerrar',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(60, 255, 217, 0),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
