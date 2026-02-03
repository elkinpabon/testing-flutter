import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/views/sales_page.dart';

void main() {
  group('PantallaPrincipal - Pruebas de Widgets', () {
    /// Prueba 1: Renderizar la pantalla sin errores
    testWidgets('Se renderiza la pantalla de ventas sin errores', (
      WidgetTester tester,
    ) async {
      // Act - Renderiza (abre) el widget
      await tester.pumpWidget(const MaterialApp(home: PantallaPrincipal()));

      // Assert - Verifica que se mostró correctamente
      print('Prueba 1: Pantalla renderizada correctamente');
      print('  - Título encontrado: Tiki Taka');
      print('  - Botón encontrado: Agregar Venta');
      expect(find.text('Tiki Taka'), findsOneWidget);
      expect(find.text('Agregar Venta'), findsOneWidget);
      expect(find.byIcon(Icons.store), findsOneWidget);
    });

    /// Prueba 2: Escribir texto en el campo de entrada
    testWidgets('Se puede escribir un monto en el campo', (
      WidgetTester tester,
    ) async {
      // Act - Renderiza el widget
      await tester.pumpWidget(const MaterialApp(home: PantallaPrincipal()));

      // Escribe en el campo
      await tester.enterText(find.byType(TextField), '500');
      await tester.pumpWidget(const MaterialApp(home: PantallaPrincipal()));

      // Assert
      print('Prueba 2: Se escribió en el campo de texto');
      print('  - Valor escrito: 500');
      expect(find.text('500'), findsWidgets);
    });
  });
}
