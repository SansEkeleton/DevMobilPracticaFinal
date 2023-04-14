import 'package:flutter/material.dart';
import 'package:app_login/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Login App',
      initialRoute: "Login",
      routes: {
        "Login": (_) =>  LoginScreen(),
        "Home": (_) =>  HomeScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
    );
  }
}
