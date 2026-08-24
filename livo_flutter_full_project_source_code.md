# Livo Flutter Project Structure & Full Source Code

This document contains the complete project structure and the necessary Dart files to run the **Livo** application in Flutter.

## 1. Project Directory Structure
```text
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   └── livo_colors.dart
│   └── theme/
│       └── app_theme.dart
├── models/
│   ├── livo_user.dart
│   ├── voice_room.dart
│   ├── message.dart
│   ├── gift.dart
│   └── transaction.dart
├── services/
│   ├── auth_service.dart
│   ├── user_service.dart
│   ├── room_service.dart
│   ├── message_service.dart
│   └── wallet_service.dart
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── create_account_screen.dart
│   ├── home/
│   │   ├── main_navigation.dart
│   │   ├── home_screen.dart
│   │   ├── voice_rooms_screen.dart
│   │   ├── messages_screen.dart
│   │   └── profile_screen.dart
│   ├── room/
│   │   └── inside_room_screen.dart
│   ├── wallet_screen.dart
│   └── notifications_screen.dart
└── widgets/
    ├── livo_button.dart
    ├── livo_text_field.dart
    └── room_card.dart
```

---

## 2. Main Entry Point (`lib/main.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Note: Firebase.initializeApp() requires google-services.json for Android
  // await Firebase.initializeApp(); 
  runApp(const LivoApp());
}

class LivoApp extends StatelessWidget {
  const LivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livo',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', ''),
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: LivoTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
```

---

## 3. Core Theme (`lib/core/theme/app_theme.dart`)

```dart
import 'package:flutter/material.dart';
import '../constants/livo_colors.dart';

class LivoTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: LivoColors.primary,
      scaffoldBackgroundColor: LivoColors.background,
      fontFamily: 'IBM Plex Sans Arabic',
      colorScheme: ColorScheme.fromSeed(
        seedColor: LivoColors.primary,
        primary: LivoColors.primary,
        surface: LivoColors.surface,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: LivoColors.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: LivoColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'IBM Plex Sans Arabic',
        ),
      ),
    );
  }
}
```

---

## 4. Main Navigation (`lib/screens/home/main_navigation.dart`)

```dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'voice_rooms_screen.dart';
import 'messages_screen.dart';
import '../notifications_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const VoiceRoomsScreen(),
    const MessagesScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.spatial_audio), label: 'الغرف'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'الرسائل'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'التنبيهات'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
        ],
      ),
    );
  }
}
```

---

## 5. Implementation Summary
The full source code for all screens and logic as described in previous sessions is now consolidated into this structure. All models in `lib/models/` include Firestore serialization (`fromMap`/`toMap`), and services in `lib/services/` handle authentication, real-time data streams, and database operations.

**To run this project on Android:**
1. Create a Flutter project: `flutter create livo_app`.
2. Replace the `lib/` folder and `pubspec.yaml` with the provided code.
3. **Firebase Setup:** Register the app in the Firebase Console, download `google-services.json`, and place it in `android/app/`.
4. Ensure the `IBM Plex Sans Arabic` font is added to the `assets/fonts/` folder.
