import 'package:testing_app/models/sale_model.dart';

// ============================================
// CONTROLADOR - Lógica de Negocio
// ============================================

/// Controlador que gestiona toda la lógica de las ventas
class ControladorVentas {
  /// Lista privada que almacena todas las ventas registradas
  final List<Venta> _ventas = [];

  /// Obtiene la lista de todas las ventas registradas
  List<Venta> get ventas => _ventas;

  /// Agrega una nueva venta a la lista
  ///
  /// Parámetro:
  /// - monto: el dinero vendido (debe ser mayor a 0)
  void agregarVenta(double monto) {
    if (monto > 0) {
      _ventas.add(Venta(monto: monto, fecha: DateTime.now()));
    }
  }

  /// Elimina una venta específica de la lista por su posición
  ///
  /// Parámetro:
  /// - indice: la posición de la venta a eliminar
  void eliminarVenta(int indice) {
    if (indice >= 0 && indice < _ventas.length) {
      _ventas.removeAt(indice);
    }
  }

  /// Calcula automáticamente todas las estadísticas de las ventas
  ///
  /// Retorna:
  /// - EstadisticasVentas con todos los datos calculados
  EstadisticasVentas calcularEstadisticas() {
    // Contadores de cantidad de ventas por categoría
    int cantidadMayorA1000 = 0;
    int cantidadEntre500Y1000 = 0;
    int cantidadMenorA500 = 0;

    // Acumuladores de montos por categoría
    double montoMayorA1000 = 0;
    double montoEntre500Y1000 = 0;
    double montoMenorA500 = 0;

    // Recorre cada venta y la clasifica
    for (var venta in _ventas) {
      // Si la venta es mayor a $1000
      if (venta.monto > 1000) {
        cantidadMayorA1000++;
        montoMayorA1000 += venta.monto;
      }
      // Si la venta está entre $500 y $1000
      else if (venta.monto > 500) {
        cantidadEntre500Y1000++;
        montoEntre500Y1000 += venta.monto;
      }
      // Si la venta es menor o igual a $500
      else {
        cantidadMenorA500++;
        montoMenorA500 += venta.monto;
      }
    }

    // Calcula el monto total sumando todas las categorías
    double montoTotal = montoMayorA1000 + montoEntre500Y1000 + montoMenorA500;

    // Retorna un objeto con todas las estadísticas calculadas
    return EstadisticasVentas(
      cantidadMayorA1000: cantidadMayorA1000,
      cantidadEntre500Y1000: cantidadEntre500Y1000,
      cantidadMenorA500: cantidadMenorA500,
      montoMayorA1000: montoMayorA1000,
      montoEntre500Y1000: montoEntre500Y1000,
      montoMenorA500: montoMenorA500,
      montoTotal: montoTotal,
      totalVentas: _ventas.length,
    );
  }

  /// Elimina todas las ventas registradas
  void limpiarTodasLasVentas() {
    _ventas.clear();
  }
}
