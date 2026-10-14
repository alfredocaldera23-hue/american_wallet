# American Wallet

App de cambio de divisas (VES ↔ COP) con diseño negro + dorado + naranja.

## Cómo empezar

1. Instala Flutter: https://docs.flutter.dev/get-started/install
2. Abre una terminal en esta carpeta
3. Ejecuta:
   ```bash
   flutter pub get
   flutter run
   ```

## Estructura

- `lib/constants/` → Colores
- `lib/theme/` → Tema de la app
- `lib/services/` → Lógica de tasa de cambio
- `lib/widgets/` → Componentes reutilizables
- `lib/screens/` → Pantallas (Login, Home, Historial, Perfil)

## Cambiar la tasa del día

Abre `lib/services/rate_service.dart` y modifica:

```dart
static double tasaDelDia = 2.81;
```

## Poner tu logo

1. Coloca tu logo PNG en `assets/images/logo_eagle.png`
2. Reemplaza el `Icon(Icons.pets...)` por:

```dart
Image.asset('assets/images/logo_eagle.png', width: 42, height: 42)
```

## Generar APK

```bash
flutter build apk --release
```

El archivo estará en: `build/app/outputs/flutter-apk/app-release.apk`
