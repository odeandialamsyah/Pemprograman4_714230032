import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'login_screen.dart'; 
 
class MyHome extends StatefulWidget { 
  const MyHome({super.key}); 
 
  @override 
  State<MyHome> createState() => _MyHomeState(); 
} 
 
class _MyHomeState extends State<MyHome> { 

  late SharedPreferences loginData;
  String username = "";

  void initialize() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('saved_username') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Home'), 
      ), 
      body: Center( 
        child: Container( 
          margin: const EdgeInsets.symmetric( 
            vertical: 12, 
            horizontal: 16, 
          ), 
          child: Column( 
            children: [ 
              const Text('Welcome to Home'), 
              const SizedBox(height: 20), 
              Text(username), 
              ElevatedButton( 
                onPressed: () async {
                  loginData = await SharedPreferences.getInstance();

                  bool rememberMe = loginData.getBool('remember_me') ?? false;

                  loginData.setBool('login', true);

                  if (!rememberMe) {
                    loginData.remove('saved_username');
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Logout'), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 