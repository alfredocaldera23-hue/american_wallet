import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  // Datos de ejemplo (después vendrán de Firebase)
  final List<Map<String, dynamic>> transacciones = const [
    {
      'id': 'TX-001',
      'fecha': '09 Oct 2026',
      'enviado': 'Bs. 50.000',
      'recibido': '\$ 140.260',
      'estado': 'Completada',
      'color': Color(0xFF00C853),
    },
    {
      'id': 'TX-002',
      'fecha': '08 Oct 2026',
      'enviado': 'Bs. 30.000',
      'recibido': '\$ 84.156',
      'estado': 'En proceso',
      'color': Color(0xFFFF8C00),
    },
    {
      'id': 'TX-003',
      'fecha': '07 Oct 2026',
      'enviado': 'Bs. 100.000',
      'recibido': '\$ 280.520',
      'estado': 'Completada',
      'color': Color(0xFF00C853),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text('Historial', style: TextStyle(color: AppColors.gold)),
        backgroundColor: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.gold),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transacciones.length,
        itemBuilder: (context, index) {
          final tx = transacciones[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.gold.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tx['id'],
                      style: const TextStyle(
                          color: AppColors.gold, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: (tx['color'] as Color).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tx['estado'],
                        style: TextStyle(
                            color: tx['color'],
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(tx['fecha'],
                    style: const TextStyle(color: AppColors.grayText, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enviado: ${tx['enviado']}',
                        style: const TextStyle(color: AppColors.white)),
                    Text('Recibido: ${tx['recibido']}',
                        style: const TextStyle(color: AppColors.white)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
