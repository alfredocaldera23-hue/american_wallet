import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/gradient_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.gold, width: 2),
                      ),
                      child: const Icon(Icons.pets, color: AppColors.gold, size: 50),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'American Wallet',
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isLogin ? 'Inicia sesión' : 'Crea tu cuenta',
                      style: const TextStyle(color: AppColors.grayText, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Email
              TextField(
                controller: _emailController,
                style: const TextStyle(color: AppColors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: const TextStyle(color: AppColors.grayText),
                  prefixIcon: const Icon(Icons.email_outlined, color: AppColors.gold),
                  filled: true,
                  fillColor: AppColors.darkCard,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: AppColors.gold),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Contraseña
              TextField(
                controller: _passwordController,
                obscureText: _obscure,
                style: const TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(color: AppColors.grayText),
                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.gold),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.gold,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  filled: true,
                  fillColor: AppColors.darkCard,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: AppColors.gold),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              GradientButton(
                text: _isLogin ? 'Iniciar sesión' : 'Registrarme',
                onPressed: () {
                  // Aquí luego conectamos Firebase Auth
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () => setState(() => _isLogin = !_isLogin),
                  child: Text(
                    _isLogin
                        ? '¿No tienes cuenta? Regístrate'
                        : '¿Ya tienes cuenta? Inicia sesión',
                    style: const TextStyle(color: AppColors.gold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
