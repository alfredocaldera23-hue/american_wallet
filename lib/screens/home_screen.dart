import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../services/rate_service.dart';
import '../widgets/currency_card.dart';
import '../widgets/gradient_button.dart';
import 'history_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _montoController = TextEditingController(text: '50000');
  double _montoRecibido = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _calcular();
    _montoController.addListener(_calcular);
  }

  void _calcular() {
    final monto = double.tryParse(
            _montoController.text.replaceAll('.', '').replaceAll(',', '.')) ??
        0;
    setState(() {
      _montoRecibido = RateService.calcularRecibido(monto);
    });
  }

  String _formatear(double valor) {
    return valor.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      _buildHomeContent(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppColors.darkCard,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.grayText,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historial'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                // Logo águila - reemplaza por Image.asset cuando tengas el logo
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gold, width: 1.5),
                  ),
                  child: const Icon(Icons.pets, color: AppColors.gold, size: 26),
                ),
                const SizedBox(width: 10),
                const Text(
                  'American Wallet',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline, color: AppColors.gold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu, color: AppColors.gold),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Título principal
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 28, height: 1.25, color: AppColors.white),
                children: [
                  TextSpan(text: 'El intercambio\n'),
                  TextSpan(
                    text: 'fácil, rápido\n',
                    style: TextStyle(
                      backgroundColor: AppColors.orange,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'y seguro\n',
                    style: TextStyle(
                      backgroundColor: AppColors.gold,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'que mereces.'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cambia divisas de forma segura, confiable y transparente. Tu dinero, en las mejores manos.',
              style: TextStyle(color: AppColors.grayText, fontSize: 14, height: 1.4),
            ),
            const SizedBox(height: 28),

            const Text(
              'Calcula tu cambio al momento',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Card Enviar
            CurrencyCard(
              titulo: 'Quiero enviar',
              monto: 'Bs. ${_formatear(double.tryParse(_montoController.text) ?? 0)}',
              moneda: 'VES',
              metodo: 'Transferencia',
              isEnviar: true,
            ),

            // Card Recibir
            CurrencyCard(
              titulo: 'Quiero recibir',
              monto: '\$ ${_formatear(_montoRecibido)}',
              moneda: 'COP',
              metodo: 'Cuenta bancaria',
              isEnviar: false,
            ),

            const SizedBox(height: 8),
            Text(
              'Tasa de conversión: Bs. 1 VES = \$${RateService.tasaDelDia.toStringAsFixed(2)} COP',
              style: const TextStyle(color: AppColors.gold, fontSize: 13),
            ),
            const SizedBox(height: 24),

            // Botones
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gold, width: 1.5),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.swap_horiz, color: AppColors.gold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GradientButton(
                    text: 'Continuar',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Solicitud enviada (demo)')),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                '⏱ Tiempo aproximado de espera: 5 - 15 minutos',
                style: TextStyle(color: AppColors.orange, fontSize: 13),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
