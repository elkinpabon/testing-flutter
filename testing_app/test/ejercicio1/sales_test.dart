import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/controllers/sales_controller.dart';
import 'package:testing_app/models/sale_model.dart';

void main() {
  group('ControladorVentas - Pruebas Unitarias', () {
    late ControladorVentas controlador;

    setUp(() {
      controlador = ControladorVentas();
    });

    /// Prueba 1: Verificar que se agrega una venta correctamente
    test('Agregar una venta y verificar que se guarda', () {
      // Arrange
      const montoVenta = 750.0;

      // Act
      controlador.agregarVenta(montoVenta);

      // Assert
      print('Prueba 1: Se agregó venta de \$$montoVenta');
      print('  - Total de ventas: ${controlador.ventas.length}');
      expect(controlador.ventas.length, 1);
      expect(controlador.ventas[0].monto, montoVenta);
    });

    /// Prueba 2: Verificar cálculo del total de ventas
    test('Calcular total de múltiples ventas', () {
      // Arrange
      const venta1 = 1500.0; 
      const venta2 = 750.0; 
      const venta3 = 200.0;
      const totalEsperado = 2480.0; 

      // Act
      controlador.agregarVenta(venta1);
      controlador.agregarVenta(venta2);
      controlador.agregarVenta(venta3);
      final estadisticas = controlador.calcularEstadisticas();

      // Assert
      print('Prueba 2: Cálculo de total');
      print('  - Venta 1: \$$venta1');
      print('  - Venta 2: \$$venta2');
      print('  - Venta 3: \$$venta3');
      print('  - Total esperado: \$$totalEsperado');
      print('  - Total calculado: \$${estadisticas.montoTotal}');
      expect(estadisticas.montoTotal, totalEsperado);
      expect(controlador.ventas.length, 3);
    });
  });
}
