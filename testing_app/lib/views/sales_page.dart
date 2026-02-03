import 'package:flutter/material.dart';
import 'package:testing_app/controllers/sales_controller.dart';
import 'package:testing_app/themes/app_theme.dart';

// ============================================
// VISTA - Interfaz de Usuario
// ============================================

/// Pantalla principal donde se registran y visualizan las ventas
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  /// Controlador que maneja la lógica de negocio
  final ControladorVentas _controlador = ControladorVentas();

  /// Controlador para el campo de texto de entrada
  final TextEditingController _controladorMonto = TextEditingController();

  @override
  void dispose() {
    _controladorMonto.dispose();
    super.dispose();
  }

  /// Agrega una nueva venta cuando el usuario presiona el botón
  void _agregarVenta() {
    // Intenta convertir el texto a número decimal
    final monto = double.tryParse(_controladorMonto.text);

    // Verifica que sea un número válido y mayor a 0
    if (monto != null && monto > 0) {
      setState(() {
        // Agrega la venta y limpia el campo
        _controlador.agregarVenta(monto);
        _controladorMonto.clear();
      });

      // Muestra mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Venta agregada exitosamente'),
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Muestra mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.warning, color: Colors.white),
              SizedBox(width: 8),
              Text('Por favor ingresa un monto válido'),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// Elimina una venta individual
  void _eliminarVenta(int indice) {
    setState(() {
      _controlador.eliminarVenta(indice);
    });
  }

  /// Muestra un diálogo para confirmar eliminar todas las ventas
  void _limpiarTodasLasVentas() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber),
            SizedBox(width: 8),
            Text('Confirmar'),
          ],
        ),
        content: const Text('¿Eliminar todas las ventas registradas?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _controlador.limpiarTodasLasVentas();
              });
              Navigator.pop(context);
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calcula las estadísticas con los datos actuales
    final estadisticas = _controlador.calcularEstadisticas();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.store, color: Colors.white),
            SizedBox(width: 8),
            Text('Tiki Taka'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sección de entrada de datos
              _construirSeccionEntrada(),
              const SizedBox(height: 24),

              // Mostrar solo el total
              if (_controlador.ventas.isNotEmpty) ...[
                _construirTotalVentas(estadisticas),
                const SizedBox(height: 16),
                _construirCategorias(estadisticas),
              ],
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  /// Construye la sección de entrada de nuevas ventas
  Widget _construirSeccionEntrada() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Text(
                  'Registrar Nueva Venta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Campo de entrada de monto
            TextField(
              controller: _controladorMonto,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: 'Ingresa el monto (\$)',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (_) => _agregarVenta(),
            ),
            const SizedBox(height: 12),

            // Botón para agregar venta
            ElevatedButton.icon(
              onPressed: _agregarVenta,
              icon: const Icon(Icons.add),
              label: const Text('Agregar Venta'),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye la tarjeta con el total de ventas
  Widget _construirTotalVentas(estadisticas) {
    return Card(
      color: TemaApp.colorPrimario,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.monetization_on, color: Colors.white, size: 48),
            const SizedBox(height: 12),
            const Text(
              'TOTAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${estadisticas.montoTotal.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye el resumen de categorías
  Widget _construirCategorias(estadisticas) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.category),
                SizedBox(width: 8),
                Text(
                  'Resumen de Categorías',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Mayor a $1000
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mayor a \$1000:'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: TemaApp.colorMayorA1000.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${estadisticas.cantidadMayorA1000}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TemaApp.colorMayorA1000,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Entre $500 y $1000
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Entre \$500 y \$1000:'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: TemaApp.colorEntre500Y1000.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${estadisticas.cantidadEntre500Y1000}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TemaApp.colorEntre500Y1000,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Menor o igual a $500
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Menor o igual a \$500:'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: TemaApp.colorMenorA500.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${estadisticas.cantidadMenorA500}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TemaApp.colorMenorA500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
