import 'dart:async';
import 'package:fitness_health_ui/view/on_boarding_screen/start_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  double _rotation = 0.0;
  double _scale = 0.5;
  double _bounceOffset = 100.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _navigateToLogin();
  }

  void _startAnimation() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _rotation = 1.0;
        _scale = 1.0;
        _bounceOffset = 0.0;
      });
    });
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartedView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              transform: Matrix4.translationValues(0.0, _bounceOffset, 0.0),
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: AnimatedRotation(
                  turns: _rotation,
                  duration: const Duration(seconds: 2),
                  child: AnimatedScale(
                    scale: _scale,
                    duration: const Duration(seconds: 2),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Center(
                        child: Image.asset("assets/img/app_logo.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}