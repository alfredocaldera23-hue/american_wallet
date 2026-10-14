import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/gradient_button.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text('Mi Perfil', style: TextStyle(color: AppColors.gold)),
        backgroundColor: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.gold),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.gold, width: 2),
              ),
              child: const Icon(Icons.person, color: AppColors.gold, size: 60),
            ),
            const SizedBox(height: 16),
            const Text(
              'Usuario American Wallet',
              style: TextStyle(
                  color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'usuario@email.com',
              style: TextStyle(color: AppColors.grayText),
            ),
            const SizedBox(height: 40),

            _buildOption(Icons.history, 'Historial de transacciones', () {}),
            _buildOption(Icons.account_balance_wallet, 'Métodos de pago', () {}),
            _buildOption(Icons.notifications_outlined, 'Notificaciones', () {}),
            _buildOption(Icons.security, 'Seguridad', () {}),
            _buildOption(Icons.help_outline, 'Ayuda y soporte', () {}),
            const SizedBox(height: 30),

            GradientButton(
              text: 'Cerrar sesión',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.gold),
      title: Text(title, style: const TextStyle(color: AppColors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.gold, size: 16),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
