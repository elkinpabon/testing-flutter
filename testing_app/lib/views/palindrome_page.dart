import 'package:flutter/material.dart';
import 'package:testing_app/controllers/palindrome_controller.dart';
import 'package:testing_app/themes/app_theme.dart';

// ============================================
// VISTA - Pantalla de Palíndromas
// ============================================

/// Pantalla para analizar si palabras son palíndromas
class PantallaPalindromo extends StatefulWidget {
  const PantallaPalindromo({super.key});

  @override
  State<PantallaPalindromo> createState() => _PantallaPalindromoState();
}

class _PantallaPalindromoState extends State<PantallaPalindromo> {
  /// Controlador que maneja la lógica de palíndromas
  final ControladorPalindromo _controlador = ControladorPalindromo();

  /// Controlador para el campo de texto
  final TextEditingController _controladorPalabra = TextEditingController();

  @override
  void dispose() {
    _controladorPalabra.dispose();
    super.dispose();
  }

  /// Analiza una palabra ingresada
  void _analizarPalabra() {
    final palabra = _controladorPalabra.text.trim();

    if (palabra.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.warning, color: Colors.white),
              SizedBox(width: 8),
              Text('Por favor ingresa una palabra'),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _controlador.analizarPalindromo(palabra);
      _controladorPalabra.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Palabra analizada'),
          ],
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// Elimina un análisis individual
  void _eliminarAnalisis(int indice) {
    setState(() {
      _controlador.eliminarAnalisis(indice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.text_fields, color: Colors.white),
            SizedBox(width: 8),
            Text('Palíndromo'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sección de entrada
            _construirSeccionEntrada(),
            const SizedBox(height: 32),

            // Mostrar resultado del último análisis
            if (_controlador.analisis.isNotEmpty) _construirResultado(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  /// Construye la sección de entrada
  Widget _construirSeccionEntrada() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Text(
                  'Ingresa una Palabra',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controladorPalabra,
              decoration: InputDecoration(
                labelText: 'Palabra',
                prefixIcon: const Icon(Icons.abc),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'ej: radar, asa, solos',
              ),
              onSubmitted: (_) => _analizarPalabra(),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _analizarPalabra,
              icon: const Icon(Icons.check),
              label: const Text('Analizar'),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye el resultado del análisis
  Widget _construirResultado() {
    final ultimoAnalisis = _controlador.analisis.last;
    final esPalindromo = ultimoAnalisis.esPalindromo;
    final color = esPalindromo
        ? TemaApp.colorMayorA1000
        : TemaApp.colorMenorA500;
    final icono = esPalindromo ? Icons.check_circle : Icons.cancel;
    final mensaje = esPalindromo ? 'ES PALÍNDROMA' : 'NO ES PALÍNDROMA';

    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icono, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              ultimoAnalisis.palabra,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              mensaje,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
