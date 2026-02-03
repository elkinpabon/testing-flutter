import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/controllers/palindrome_controller.dart';

void main() {
  group('ControladorPalindromo - Pruebas Unitarias', () {
    late ControladorPalindromo controlador;

    setUp(() {
      controlador = ControladorPalindromo();
    });

    /// Prueba 1: Verificar que radar es una palíndroma
    test('Verificar que "radar" es palíndroma', () {
      // Arrange
      const palabra = 'radar';

      // Act
      final resultado = controlador.analizarPalindromo(palabra);

      // Assert
      print('✓ Prueba 1: Validar palíndroma');
      print('  - Palabra: $palabra');
      print('  - Es palíndroma: ${resultado.esPalindromo}');
      print('  - Original: ${resultado.palabra}');
      print('  - Invertida: ${resultado.palabraInvertida}');
      expect(resultado.esPalindromo, true);
      expect(resultado.palabra, palabra);
      expect(controlador.analisis.length, 1);
    });

    /// Prueba 2: Verificar que "hello" NO es palíndroma
    test('Verificar que "hello" NO es palíndroma', () {
      // Arrange
      const palabra = 'hello';

      // Act
      final resultado = controlador.analizarPalindromo(palabra);

      // Assert
      print(' Prueba 2: Validar NO palíndroma');
      print('  - Palabra: $palabra');
      print('  - Es palíndroma: ${resultado.esPalindromo}');
      print('  - Original: ${resultado.palabra}');
      print('  - Invertida: ${resultado.palabraInvertida}');
      expect(resultado.esPalindromo, false);
      expect(resultado.palabra, palabra);
    });
  });
}
