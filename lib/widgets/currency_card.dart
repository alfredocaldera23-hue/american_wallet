import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CurrencyCard extends StatelessWidget {
  final String titulo;
  final String monto;
  final String moneda;
  final String metodo;
  final bool isEnviar;
  final VoidCallback? onMonedaTap;
  final VoidCallback? onMetodoTap;

  const CurrencyCard({
    super.key,
    required this.titulo,
    required this.monto,
    required this.moneda,
    required this.metodo,
    this.isEnviar = true,
    this.onMonedaTap,
    this.onMetodoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withOpacity(0.4), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(color: AppColors.grayText, fontSize: 13),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                monto,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onMonedaTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.gold.withOpacity(0.5)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        moneda,
                        style: const TextStyle(
                          color: AppColors.gold,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down, color: AppColors.gold, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Barra de color
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(
                colors: isEnviar
                    ? [const Color(0xFF00C853), AppColors.orange]
                    : [AppColors.orange, const Color(0xFF00C853)],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.account_balance, color: AppColors.gold, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isEnviar ? 'Método de pago' : 'Método de recepción',
                  style: const TextStyle(color: AppColors.grayLight, fontSize: 13),
                ),
              ),
              GestureDetector(
                onTap: onMetodoTap,
                child: Row(
                  children: [
                    Text(
                      metodo,
                      style: const TextStyle(color: AppColors.white, fontSize: 13),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: AppColors.gold, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
