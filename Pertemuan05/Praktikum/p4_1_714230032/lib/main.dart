import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Bandung',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        fontFamily: 'Staatliches',
      ),
      home: const MainScreen(),
    );
  }
}