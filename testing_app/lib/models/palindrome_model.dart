// ============================================
// MODELO - Datos de Palíndromas
// ============================================

/// Representa el análisis de una palabra palíndroma
class AnalisisPalindromo {
  /// La palabra original ingresada
  final String palabra;

  /// La palabra sin espacios ni caracteres especiales
  final String palabraLimpia;

  /// La palabra en minúsculas
  final String palabraMinuscula;

  /// La palabra invertida
  final String palabraInvertida;

  /// Si es o no palíndroma
  final bool esPalindromo;

  AnalisisPalindromo({
    required this.palabra,
    required this.palabraLimpia,
    required this.palabraMinuscula,
    required this.palabraInvertida,
    required this.esPalindromo,
  });
}

/// Contiene el historial de palíndromas analizadas
class EstadisticasPalindromo {
  /// Total de palabras analizadas
  final int totalAnalisis;

  /// Cantidad de palabras que SÍ son palíndromas
  final int cantidadPalindromas;

  /// Cantidad de palabras que NO son palíndromas
  final int cantidadNoPalindromas;

  /// Porcentaje de palíndromas
  final double porcentajePalindromas;

  EstadisticasPalindromo({
    required this.totalAnalisis,
    required this.cantidadPalindromas,
    required this.cantidadNoPalindromas,
    required this.porcentajePalindromas,
  });
}
