import 'package:flutter/material.dart';

void main() {
  runApp(const LivoApp());
}

class LivoApp extends StatelessWidget {
  const LivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Livo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Livo'),
        ),
        body: const Center(
          child: Text(
            'مرحباً بك في Livo 🎙️',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
