// ============================================
// MODELO - Datos de Ventas
// ============================================

/// Representa una venta individual realizada
class Venta {
  /// Monto de dinero de la venta
  final double monto;

  /// Fecha y hora de la venta
  final DateTime fecha;

  Venta({required this.monto, required this.fecha});
}

/// Contiene todas las estadísticas calculadas de las ventas
class EstadisticasVentas {
  /// Cantidad de ventas mayores a $1000
  final int cantidadMayorA1000;

  /// Cantidad de ventas entre $500 y $1000
  final int cantidadEntre500Y1000;

  /// Cantidad de ventas menores o iguales a $500
  final int cantidadMenorA500;

  /// Monto total en ventas mayores a $1000
  final double montoMayorA1000;

  /// Monto total en ventas entre $500 y $1000
  final double montoEntre500Y1000;

  /// Monto total en ventas menores o iguales a $500
  final double montoMenorA500;

  /// Monto total global vendido
  final double montoTotal;

  /// Total de ventas registradas
  final int totalVentas;

  EstadisticasVentas({
    required this.cantidadMayorA1000,
    required this.cantidadEntre500Y1000,
    required this.cantidadMenorA500,
    required this.montoMayorA1000,
    required this.montoEntre500Y1000,
    required this.montoMenorA500,
    required this.montoTotal,
    required this.totalVentas,
  });
}
