import 'package:flutter/material.dart';
import 'package:testing_app/themes/app_theme.dart';
import 'package:testing_app/views/sales_page.dart';
import 'package:testing_app/views/palindrome_page.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios - Sistema Educativo',
      theme: TemaApp.temaClaro,
      darkTheme: TemaApp.temaOscuro,
      themeMode: ThemeMode.system,
      home: const MenuPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Pantalla principal con menú de ejercicios
class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.school, color: Colors.white),
            SizedBox(width: 8),
            Text('Prueba Tercer Parcial'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ejercicio 1: Ventas
            Card(
              margin: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: TemaApp.colorMayorA1000.withOpacity(0.1),
                  border: Border.all(color: TemaApp.colorMayorA1000, width: 2),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  leading: Icon(
                    Icons.store,
                    size: 48,
                    color: TemaApp.colorMayorA1000,
                  ),
                  title: const Text(
                    'Ejercicio 1: Registro de Ventas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Categorizar ventas por rango de precio',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaPrincipal(),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Ejercicio 2: Palíndromas
            Card(
              margin: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: TemaApp.colorEntre500Y1000.withOpacity(0.1),
                  border: Border.all(
                    color: TemaApp.colorEntre500Y1000,
                    width: 2,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  leading: Icon(
                    Icons.text_fields,
                    size: 48,
                    color: TemaApp.colorEntre500Y1000,
                  ),
                  title: const Text(
                    'Ejercicio 2: Validador de Palíndromas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Verificar si una palabra es palíndroma',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaPalindromo(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
