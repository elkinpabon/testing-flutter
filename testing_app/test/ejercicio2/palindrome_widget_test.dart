import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/views/palindrome_page.dart';

void main() {
  group('PantallaPalindromo - Pruebas de Widgets', () {
    /// Prueba 1: Renderizar la pantalla sin errores
    testWidgets('Se renderiza la pantalla de palíndromo sin errores', (
      WidgetTester tester,
    ) async {
      // Act - Renderiza (abre) el widget
      await tester.pumpWidget(const MaterialApp(home: PantallaPalindromo()));

      // Assert - Verifica que se mostró correctamente
      print('✓ Prueba 1: Pantalla renderizada correctamente');
      print('  - Título encontrado: Palíndromo');
      print('  - Botón encontrado: Analizar');
      expect(find.text('Palíndromo'), findsOneWidget);
      expect(find.text('Analizar'), findsOneWidget);
      expect(find.byIcon(Icons.text_fields), findsOneWidget);
    });

    /// Prueba 2: Escribir una palabra en el campo
    testWidgets('Se puede escribir una palabra en el campo', (
      WidgetTester tester,
    ) async {
      // Act - Renderiza el widget
      await tester.pumpWidget(const MaterialApp(home: PantallaPalindromo()));

      // Escribe en el campo
      await tester.enterText(find.byType(TextField), 'radar');
      await tester.pumpWidget(const MaterialApp(home: PantallaPalindromo()));

      // Assert
      print('✓ Prueba 2: Se escribió en el campo de texto');
      print('  - Palabra escrita: radar');
      expect(find.text('radar'), findsWidgets);
    });
  });
}
