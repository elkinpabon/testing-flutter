import 'package:testing_app/models/palindrome_model.dart';

// ============================================
// CONTROLADOR - Lógica de Palíndromas
// ============================================

/// Controlador que gestiona la lógica de análisis de palíndromas
class ControladorPalindromo {
  /// Lista privada que almacena todos los análisis realizados
  final List<AnalisisPalindromo> _analisis = [];

  /// Obtiene la lista de todos los análisis realizados
  List<AnalisisPalindromo> get analisis => _analisis;

  /// Analiza una palabra para verificar si es palíndroma
  ///
  /// Parámetro:
  /// - palabra: la palabra a analizar
  ///
  /// Retorna:
  /// - AnalisisPalindromo con el análisis completo
  AnalisisPalindromo analizarPalindromo(String palabra) {
    // Limpia la palabra: elimina espacios
    String palabraLimpia = palabra.replaceAll(' ', '');

    // Verifica que no esté vacía
    if (palabraLimpia.isEmpty) {
      return AnalisisPalindromo(
        palabra: palabra,
        palabraLimpia: palabraLimpia,
        palabraMinuscula: '',
        palabraInvertida: '',
        esPalindromo: false,
      );
    }

    // Convierte a minúsculas para comparación sin importar mayúsculas
    String palabraMinuscula = palabraLimpia.toLowerCase();

    // Lógica simple: invertir la palabra
    String palabraInvertida = palabraMinuscula.split('').reversed.join('');

    // Comparar si la palabra es igual a su inversa
    bool esPalindromo = palabraMinuscula == palabraInvertida;

    // Crear objeto de análisis
    AnalisisPalindromo resultado = AnalisisPalindromo(
      palabra: palabra,
      palabraLimpia: palabraLimpia,
      palabraMinuscula: palabraMinuscula,
      palabraInvertida: palabraInvertida,
      esPalindromo: esPalindromo,
    );

    // Guardar en historial (permitir máximo 1 análisis activo)
    _analisis.clear();
    _analisis.add(resultado);

    return resultado;
  }

  /// Elimina un análisis individual por índice
  void eliminarAnalisis(int indice) {
    if (indice >= 0 && indice < _analisis.length) {
      _analisis.removeAt(indice);
    }
  }

  /// Limpia todos los análisis
  void limpiarTodos() {
    _analisis.clear();
  }

  /// Calcula las estadísticas de los palíndromas analizados
  ///
  /// Retorna:
  /// - EstadisticasPalindromo con los datos calculados
  EstadisticasPalindromo calcularEstadisticas() {
    // Contadores
    int cantidadPalindromas = 0;
    int cantidadNoPalindromas = 0;

    // Recorre cada análisis y cuenta
    for (var analisis in _analisis) {
      if (analisis.esPalindromo) {
        cantidadPalindromas++;
      } else {
        cantidadNoPalindromas++;
      }
    }

    // Calcula porcentaje
    double porcentaje = 0;
    if (_analisis.isNotEmpty) {
      porcentaje = (cantidadPalindromas / _analisis.length) * 100;
    }

    return EstadisticasPalindromo(
      totalAnalisis: _analisis.length,
      cantidadPalindromas: cantidadPalindromas,
      cantidadNoPalindromas: cantidadNoPalindromas,
      porcentajePalindromas: porcentaje,
    );
  }
}
