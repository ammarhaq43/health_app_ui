import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_health_ui/firebase_options.dart';
import 'package:fitness_health_ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fitness 3 in 1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Poppins",
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: "Poppins",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}