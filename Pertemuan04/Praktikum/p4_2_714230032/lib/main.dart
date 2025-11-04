import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas Pertemuan 4'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: const LayoutExample(),
      ),
    );
  }
}

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Box 1
          Container(
            width: 200,
            height: 60,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              'Box 1',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          // Box 2 dan Box 3 sejajar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 120,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  'Box 2',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 80,
                height: 120,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  'Box 3',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
