import 'package:flutter/foundation.dart';

class RateService {
  // =============== AQUÍ CAMBIAS LA TASA DEL DÍA ===============
  // Cuando seas admin, solo cambia este valor y reinicia la app
  // (más adelante se puede conectar a Firebase / panel admin)
  static double tasaDelDia = 2.81; // 1 VES = X COP

  static double calcularRecibido(double montoVES) {
    return montoVES * tasaDelDia;
  }

  static void actualizarTasa(double nuevaTasa) {
    tasaDelDia = nuevaTasa;
    debugPrint('Tasa actualizada a: $nuevaTasa');
  }
}
