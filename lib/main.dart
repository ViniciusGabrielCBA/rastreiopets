// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:rastreiopets/screens/home/home_screen.dart';
import 'package:rastreiopets/screens/login/login_screen.dart';
import 'package:rastreiopets/screens/login/signup_screen.dart';
import 'package:rastreiopets/screens/pets_screen/addPets.dart';
import 'package:rastreiopets/screens/pets_screen/removePets.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Rastreio de Pets',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        "/home": (context) => const HomeScreen(),
        "/addPets": (context) => const AddPets(),
        "/removePets": (context) => const RemovePets(),
        "/login": (context) => LoginScreen(),
        "/signUp": (context) => SignUpScreen(),
      },
    );
  }
}
