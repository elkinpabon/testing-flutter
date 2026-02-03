import 'package:flutter/material.dart';

// ============================================
// TEMA GLOBAL - Estilos Reutilizables
// ============================================

/// Tema global reutilizable para toda la aplicación
class TemaApp {
  // ========== COLORES PRIMARIOS ==========
  /// Color principal púrpura
  static const Color colorPrimario = Color(0xFF6200EE);

  /// Color secundario cian
  static const Color colorSecundario = Color(0xFF03DAC6);

  /// Color de fondo gris claro
  static const Color colorFondo = Color(0xFFFAFAFA);

  /// Color de superficies (blanco)
  static const Color colorSuperficie = Colors.white;

  // ========== COLORES DE CATEGORÍAS ==========
  /// Verde para ventas mayores a $1000
  static const Color colorMayorA1000 = Color(0xFF4CAF50);

  /// Ámbar para ventas entre $500 y $1000
  static const Color colorEntre500Y1000 = Color(0xFFFFC107);

  /// Azul para ventas menores a $500
  static const Color colorMenorA500 = Color(0xFF2196F3);

  // ========== COLORES DE TEXTO ==========
  /// Texto oscuro
  static const Color colorTextoOscuro = Color(0xFF212121);

  /// Texto claro/secundario
  static const Color colorTextoClaro = Color(0xFF757575);

  // ========== TEMA CLARO ==========
  static ThemeData temaClaro = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimario,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: colorFondo,
    appBarTheme: const AppBarTheme(
      backgroundColor: colorPrimario,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 4,
    ),
    cardTheme: CardThemeData(
      color: colorSuperficie,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorPrimario,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: colorTextoClaro),
    ),
  );

  // ========== TEMA OSCURO ==========
  static ThemeData temaOscuro = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimario,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: colorPrimario,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 4,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorPrimario,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[900],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: colorTextoClaro),
    ),
  );
}
